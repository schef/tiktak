# The Tic Tac Story (based on a real life event)
## About
Past, present and future.
In between a spaceship that simulates rooms from both periods to solve the puzzle.
Few years ago...in a place so close to yours.


## Running AGS v.3.6.0.35 - Beta 15 using wine
Download the binary [here](https://github.com/adventuregamestudio/ags/releases/tag/v.3.6.0.35)
- i have wine-7.16 (Staging)
- run `WINEARCH=win32 winecfg` (install mono and gecko when prompt)
- run `winetricks -q vcrun2015 dotnet46`
- run `wine AGS-3.6.0.35-Beta15.exe` and install all stuff but you could ignore microsoft visual c++
- run `wine ~/.wine/drive_c/Program\ Files/Adventure\ Game\ Studio\ 3.6.0/AGSEditor.exe`
