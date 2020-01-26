# Changelog
All notable changes to this project will be documented in this file.

Tag **BREAKING:** means that change breaks compatybility with ealier version
of the project.

## [Unreleased]

### Added
- Binding for Tk `menu` widget
- Binding for Tk `wm` command
- Binding for Tk `ttk:button` widget
- Binding fot Tk `image` command
- Binding for Tk `photo` object
- Binding for Tk `ttk:treeview` widget
- Binding for Tk `panedwindow` widget
- Binding for Tk `scrollbar` widget
- Binding for Tk `scale` widget
- Binding for Tk `menubutton` widget
- Binding for Tk `ttk::progresbar` widget
- Binding for Tk `ttk::frame` widget
- Binding for Tk `spinbox` widget
- Binding for Tk `ttk::separator` widget
- Binding for Tk `ttk::panedwindow` widget
- Binding for Tk `ttk::scrollbar` widget
- Binding for Tk Dialogs commands: `tk_chooseDirectory`, `tk_Dialog`,
  `tk_getOpenFile`, `tk_getSaveFile`, `tk_messageBox`
- Binding for Tk `ttk::menubutton` widget
- Binding for Tk `ttk::scale` widget
- Binding for Tk `ttk::checkbutton` widget
- Binding for Tk `ttk::radiobutton` widget
- Binding for Tk `ttk::spinbox` widget
- Binding for Tk `ttk::style` command
- Binding for Tk `grid` command
- Binding for Tk `ttk::label` widget
- Binding for Tk `ttk::labelframe` widget

### Changed
- Enabled Get\_Main\_Window function
- Updated README.md
- **BREAKING:** Renamed Widget, Button, Frame, Toplevel, Checkbutton,
  Radiobutton, Label, EntryWidget, Message type to Tk\_Widget, Tk\_Button,
  Tk\_Frame, Tk\_Toplevel, Tk\_CheckButton, Tk\_RadioButton, Tk\_Label,
  Tk\_Entry, Tk\_Message
- **BREAKING:** Moved all widgets to separated packages
- **BREAKING:** Merged all Tcl.Tk.Ada Create procedures and functions
- **BREAKING:** Replaced obsolescent code
- **BREAKING:** Updated demos to new version of the library
- **BREAKING:** Moved all main window code to separated package
- **BREAKING:** Moved all pack binding code to separated package

### Fixed
- Detecting Tcl libraries by setup.tcl script on Windows

## [8.6.0] - 2019-12-31
Initial release, differences below are differeces with TASH

### Added
- Added [ROBODoc](https://rfsber.home.xs4all.nl/Robo/) documentation

### Removed
- **BREAKING:** Removed legacy code which not works with newest versions of
            Tcl/Tk
- **BREAKING:** Removed creating relocatable version of the library
- **BREAKING:** Removed makefiles
- Removed tests
