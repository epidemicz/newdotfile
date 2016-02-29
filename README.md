# New Dot File
A simple PowerShell script to create .dotfiles on Windows.  Integrates with explorer to give a "New .dotfile here" option in the context menu.

## Obtaining
##### Source Code
Clone with `git clone https://github.com/epidemicz/newdotfile.git` or download it [here](https://github.com/epidemicz/newdotfile/archive/master.zip).

- Run build.bat *(hope it works)*.
- See the directions for **Installing**.

##### Download latest release
Get the latest release [here](https://github.com/epidemicz/newdotfile/releases/latest).
- See the directions for **Installing**.

## Installing
- Run the `regkey\new_dotfile_here.reg` file.
  - This should add a "New .dotfile here" option to your explorer's context menu. 
- Copy the output folder to somewhere in your path or add it to your path variable.
  - You don't need the `regkey` folder.
  - Should look like this:
    - `src\newdotfile.ps1`
    - `dotfile.bat`
- Test your right click menu out, it *should be* working.
