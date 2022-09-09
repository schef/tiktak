#!/usr/bin/env python3

import os
import sys
import shutil
import select
import pty
import time
from subprocess import Popen
import shutil

EXPORT = "./releases"
NAME = "TheTicTacStory"
FROM = "./ags/TheTicTacStory/Compiled/Windows"


class Base:
    # Foreground:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    # Formatting
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'
    # End colored text
    END = '\033[0m'
    NC = '\x1b[0m'  # No Color


def run_bash_cmd(cmd, print=None, interaction={}, return_lines=True, return_code=False, cr_as_newline=False):
    if print is not None: print("CMD:", cmd)
    master_fd, slave_fd = pty.openpty()
    line = ""
    lines = []
    with Popen(cmd, shell=True, preexec_fn=os.setsid, stdin=slave_fd, stdout=slave_fd, stderr=slave_fd, universal_newlines=True) as p:
        while p.poll() is None:
            r, w, e = select.select([sys.stdin, master_fd], [], [], 0.01)
            if master_fd in r:
                o = os.read(master_fd, 10240).decode("UTF-8")
                if o:
                    for c in o:
                        if cr_as_newline and c == "\r":
                            c = "\n"
                        if c == "\n":
                            if line and line not in interaction.values():
                                clean = line.strip().split('\r')[-1]
                                lines.append(clean)
                                if print is not None: print("STD:", line)
                            line = ""
                        else:
                            line += c
            if line:  # pass password to prompt
                for key in interaction:
                    if key in line:
                        if print is not None: print("PMT:", line)
                        time.sleep(1)
                        os.write(master_fd, ("%s" % (interaction[key])).encode())
                        os.write(master_fd, "\r\n".encode())
                        line = ""
        if line:
            clean = line.strip().split('\r')[-1]
            lines.append(clean)

    os.close(master_fd)
    os.close(slave_fd)

    if return_lines and return_code:
        return lines, p.returncode
    elif return_code:
        return p.returncode
    else:
        return lines


def get_full_path(path):
    return os.path.realpath(os.path.expanduser(path))


def write_lines_to_file(lines, filename):
    filename = get_full_path(filename)
    with open(filename, 'w') as f:
        f.write("\n".join(lines))


def read_lines_from_file(filename):
    filename = get_full_path(filename)
    with open(filename, 'r') as f:
        lines = f.read().splitlines()
    return lines


def check_if_path_exists(path):
    return os.path.exists(get_full_path(path))


def create_path(path):
    os.makedirs(get_full_path(path), exist_ok=True)


def remove_path(path):
    if check_if_path_exists(path):
        shutil.rmtree(get_full_path(path))


def get_version() -> str:
    version = input("version: ")
    return version


def get_name(version):
    return f"{NAME}_{version}"


if __name__ == "__main__":
    name = get_name(get_version())
    full_dir_to = f"{EXPORT}/{name}"
    full_dir_from = get_full_path(FROM)
    create_path(full_dir_to)
    files = os.listdir(full_dir_from)
    print(files)
    for f in files:
        shutil.copy(f"{full_dir_from}/{f}", full_dir_to)
    run_bash_cmd(f"zip -r {EXPORT}/{name}.zip {full_dir_to}")
