# Changelog
All notable changes to this project will be documented in this file.

Tag **BREAKING:** means that change breaks compatibility with earlier version
of the project.

## [Unreleased]

### Added
- Binding for Tk `photo` commands: `put`, `read`, `redither`,
  `transparency get`, `transparency set`, `write`
- Binding for Tk `ttk::entry` commands: `delete`, `insert`
- Binding for Tk `tk busy` commands: `cget`, `configure`, `current`, `status`
- Binding for Tk `ttk::style` commands: `lookup`, `element create`,
  `element names`, `element options`
- Binding for Tk `menu` command: `invoke`
- Binding for Tk `canvas` commands: `addtag`, `bbox`, `bind`
- Binding for Tk `ttk::panedwindow` command: `insert`

### Changed
- Updated README.md

### Fixed
- Configure the library on headless systems (mostly for Docker)
- Typos in contributing guide
- Missing code documentation for Tk `button` and `ttk::button` `invoke` command

## [8.6.2] - 2020-02-29

### Added
- Binding for Tk `winfo` command
- Binding for Tk Menu `delete` command
- **BREAKING:** creating relocatable version of library
- Binding for Tk `ttk::tree_view` commands: `selection`, `selection add`,
  `selection set`, `selection remove`, `selection toggle`, `children`,
  `exists`, `move`, `index`, `column`
- Binding for Tk `ttk::notebook` widget
- Binding for Tk `grid` commands: `anchor`, `bbox`, `location`, `propagate`,
  `remove`, `size`, `slaves`
- Binding for Tk `listbox` widget
- Binding for Tk `ttk::entry` widget
- Binding for Tk `ttk::combobox` widget
- Binding for Tk `menu` command: `entryconfigure`
- Binding for Tk `tk_optionMenu` widget
- Binding for Tk `ttk::style` commands: `layout`, `map`
- Binding for Tk `photo` commands: `blank`, `data`, `get`
- Binding for Tk `ttk::progressbar` command: `step`
- Binding for Tk `busy` command
- Binding for Tk `entry` commands: `delete`, `insert`

### Changed
- Made procedure `Execute_Widget_Command` public
- Updated README.md
- Updated code documentation
- Function `heading` in `ttktreeview` can get value for the selected option

### Fixed
- Typos in changelog
- Creating missing directories when build the library
- Info about failed to load Tklib `tooltip` package
- Loading Tklib `tooltip` package
- Crash setup script with -Wformat enabled
- Procedure `destroy` in Tcl.Tk.Ada.Widgets

## [8.6.1] - 2020-01-31

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
- Binding for Tk `canvas` widget
- Binding for Tk `text` widget
- Binding for Tklib `tooltip` package
- Binding for Tk `bitmap` object

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
- **BREAKING:** Made Tk binding as module
- Updated [ROBODoc](https://rfsber.home.xs4all.nl/Robo/) documentation

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
