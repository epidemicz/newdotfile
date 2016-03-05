# New Dot File
A simple PowerShell script to create .dotfiles on Windows.  Integrates with explorer to give a "New .dotfile here" option in the context menu.

![Explorer menu screenshot](/../scr/menu_screenshot.png)

![Console screenshot](/../scr/console_screenshot.png)

## Coming soon(ish)
A [chocolatey](https://github.com/chocolatey/choco) package!

## Obtaining
##### Source Code
Clone with `git clone https://github.com/epidemicz/newdotfile.git` or download it [here](https://github.com/epidemicz/newdotfile/archive/master.zip).

- See the directions for **Installing**.

##### Download latest release
Get the latest release [here](https://github.com/epidemicz/newdotfile/releases/latest).
- See the directions for **Installing**.

## Installing
- To enable the context menu, run `contextmenu/install.bat` as Administrator.
  - This should add a "New .dotfile here" option to your explorer's context menu. 
- Add the `newdotfile` directory to your path environment variable.

## Uninstalling
- To remove the context menu, run `contextmenu/uninstall.bat` as Administrator.
- Delete the `newdotfile` directory.
