# Changelog
All notable changes to this project will be documented in this file.

Tag **BREAKING:** means that change breaks compatibility with earlier version
of the project.

## [8.6.12] - 2021-09-08

### Added
- Constant Null_Interp
- Procedure `Dialog` to `Dialogs` package
- Option to build only console version of binding (Tcl + msgcat)

### Changed
- **BREAKING:** Type Tcl_Interp to System.Address. In the most cases it
  should'nt not break anything.
- Updated code documentation
- Ability to use the library in SPARK code
- Default compilation flags for the library

## [8.6.11] - 2020-12-18

### Changed
- Replaced using Widget_Image in code on just Widget in many subprograms
- Updated README.md
- Moved contributing guide to the project documentation
- Moved code of conduct to the project documentation

### Fixed
- Raising Tk\_Widgets commands (Tcl.Tk.Ada.Widgets.Widget\_Raise)
- Lowering Tk\_Widgets below another selected (Tcl.Tk.Ada.Widgets.Lower)
- Typos and grammar in README.md

## [8.6.10] - 2020-10-13

### Changed
- Updated code documentation

## [8.6.9] - 2020-09-30

### Added
- Function `Get_Widget` to get existing Tk widgets

### Changed
- Updated code documentation
- Updated README.md

## [8.6.8] - 2020-08-31

### Added
- Binding for Tk command: `bind tag sequence`

### Changed
- Updated code documentation
- Removed generating debugging information from default compilation flags
- Updated README.md

### Fixed
- Code documentation for Tcl.Tklib.Ada.GetString.Tk\_Get\_String and
  Tcl.Tk.Ada.Widgets.TtkEntry.TtkComboBox and Tcl.Tk.Ada.Widgets.Listbox.Yview
- Setting transparency (Tcl.Tk.Image.Photo.Transparency\_Set) for photo images

## [8.6.7] - 2020-07-31

### Added
- Biding for Tk `clipboard` commands: `append`, `clear`, `get`
- Binding for msgcat commands: `mc`, `mclocale`, `mcload`, `mcset`, `mcmax`,
  `mcexists`, `mcpreferences`, `mcloadedlocales get`, `mcforgetpackage`,
  `mcloadedlocales present`, `mcloadedlocales clear`, `mcmset`
- Binding for Tk `selection` commands: `clear`, `get`, `handle`, `own` (get
  name of owner of selection), `own` (set owner of selection)
- Binding for Tklib `autoscroll` commands: `wrap`, `unwrap`, `autoscroll`,
  `unautoscroll`
- Binding for Tk `option` command: `add`, `clear`, `get`, `readfile`
- Binding for Tklib `getstring` package
- Binding for Tk command: `bell`, `bindtags`, `tk caret`, `tk inactive`,
  `tk scaling`, `tk useinputmethods`
- Binding for Tklib `tooltip` commands: `clear`, `disable`, `enable`, `delay`,
  `fade`
- Binding for Tklib `ctext` commands: `ctext`, `addHighlightClass`,
  `addHighlightClassWithOnlyCharStart`, `addHighlightClassForSpecialChars`,
  `addHighlightClassForRegexp`, `clearHighlightClasses`, `getHighlightClasses`,
  `deleteHighlightClass`, `enableComments`, `disableComments`, `highlight`,
  `fastdelete`, `fastinsert`, `copy`, `cut`, `paste`, `append`

### Changed
- Updated code documentation
- Updated README.md

## [8.6.6] - 2020-06-30

### Added
- Binding for Tk `ttk::notebook` commands: `insert`, `tab`, `tabs`
- Binding for Tk `ttk::panedwindow` commands: `identify element`,
  `identify sash`, `pane`, `sashpos`
- Binding for Tk `ttk::progressbar` commands: `start`, `stop`
- Binding for Tk `ttk::scrollbar` commands: `delta`, `fraction`, `get`, `set`
- Binding for Tk `ttk::sizegrip` widget
- Binding for Tk `ttk::spinbox` commands: `current`, `set`
- Binding for Tk `ttk::treeview` commands: `identify region`,
  `identify column`, `identify element`, `identify item`, `see`, `set`,
  `tag add`,`tag bind`, `tag configure`, `tag has`, `tag names`,
  `tag remove`, `xview`, `xview moveto`, `xview scroll`, `yview`,
  `yview moveto`, `yview scroll`
- Binding for Tk commands: `identify element`, `tk_popup`, `tkwait`,
  `tk_chooseColor`, `tk_fontchooser configure`, `tk_fontchooser show`,
  `tk_fontchooser hide`, `tk_focusNext`, `tk_focusPrev`, `tk_focusFollowsMouse`
- Option to save the project settings in setup script to the file (issue #3)
- Binding for Tk `font` commands: `actual`, `configure`, `create`, `delete`,
  `families`, `measure`, `metrics`, `names`
- Binding for Tk `canvas` command `create` as function
- Binding for Tk `event` commands: `add`, `delete`, `generate`, `info`
- Binding for Tk `grab` commands: `current`, `release`, `set`, `status`

### Changed
- Updated code documentation
- Updated README.md

### Fixed
- Confusion about available bindings for build in setup script (issue #1)
- Don't display unnecessary settings on Windows systems (issue #2)
- The setup script doesn't supports spaces in paths (issue #4)
- The setup script doesn't use entered paths (issue #5)

## [8.6.5] - 2020-05-31

### Added
- Binding for Tk `spinbox` commands: `selection element`, `set`
- Binding for Tk `entry` commands: `bbox`, `icursor`, `index`, `scan mark`,
  `scan dragto`, `seletion adjust`, `selection clear`, `selection from`,
  `selection present`, `selection range`, `selection to`, `validate`, `xview`
  `xview moveto`, `xview scroll`
- Binding for Tk `text` commands: `bbox`, `compare`, `count`, `debug`,
  `dlineinfo`, `dump`, `edit canredo`, `edit canundo`, `edit modified`,
  `edit redo`, `edit reset`, `edit separator`, `edit undo`, `get`,
  `image cget`, `image configure`, `image create`, `image names`, `index`,
  `mark gravity`, `mark names`, `mark next`, `mark previous`, `mark set`,
  `mark unset`, `peer create`, `peer names`, `pendingsync`, `replace`,
  `scan mark`, `scan dragto`, `search`, `see`, `sync`, `tag bind`, `tag cget`,
  `tag delete`, `tag names`, `tag nextrange`, `tag prevrange`, `tag raise`,
  `tag range`, `tag remove`, `window cget`, `window configure`,
  `window create`, `window names`, `xview`, `xview moveto`, `xview scroll`,
  `yview`, `yview moveto`, `yview scroll`
- Binding for Tk `ttk::scale` commands: `get`, `set`
- Binding for Tk `ttk::combobox` commands: `current`, `set`
- Binding for Tk `ttk::entry` commands: `bbox`, `icursor`, `index`,
  `selection clear`, `selection present`, `selection range`, `validate`,
  `xview`, `xview moveto`, `xview scroll`
- Binding for Tk `ttk::notebook` commands: `forget`, `identify element`,
  `identify tab`, `index`

### Changed
- Updated code documentation
- Updated README.md
- **BREAKING:** Moved Tcl.Tk.Widgets.SpinBox to Tcl.Tk.Widgets.TEntry.SpinBox
- **BREAKING:** Moved Tcl.Tk.Widgets.TtkSpinBox to
  Tcl.Tk.Widgets.TtkEntry.TtkSpinBox
- **BREAKING:** Moved Tcl.Tk.Widgets.TtkComboBox to
  Tcl.Tk.Widgets.TtkEntry.TtkComboBox

## [8.6.4] - 2020-04-30

### Added
- Binding for Tk `canvas` commands: `xview scroll`, `yview`, `yview moveto`,
  `yview scroll`
- Bindind for Tk `listbox` commands: `activate`, `bbox`, `curselection`,
  `delete`, `get`, `index`, `insert`, `itemcget`, `itemconfigure`, `nearest`,
  `scan mark`, `scan dragto`, `see`, `selection anchor`, `selection clear`,
  `selection include`, `selection set`, `size`, `xview`, `xview moveto`,
  `xview scroll`, `yview`, `yview moveto`, `yview scroll`
- Binding for Tk `place` commands: `place`, `configure`, `forget`, `info`,
  `slaves`
- Binding for Tk `image` commands: `height`, `width`,`inuse`, `names`, `type`
- Binding for Tk `menu` commands: `activate`, `clone`, `entrycget`, `index`,
  `insert`, `post`, `postcascade`, `type`, `unpost`, `xposition`, `yposition`
- Binding for Tk `panedwindow` commands: `add`, `forget`, `identify`,
  `proxy coord`, `proxy forget`, `proxy place`, `sash coord`, `sash dragto`,
  `sash mark`, `sash place`, `panecget`, `paneconfigure`, `panes`
- Binding for Tk commands: `lower`, `raise`
- Binding for Tk `scale` commands: `coords`, `get`, `identify`, `set`
- Binding for Tk `scrollbar` commands: `activate`, `delta`, `fraction`, `get`,
  `identify`, `set`
- Binding for Tk `spinbox` command: `bbox`, `delete`, `get`, `icursor`,
  `identify`, `index`, `insert`, `invoke`

### Changed
- Updated code documentation

### Fixed
- Code documentation for Tcl.Tk.Ada.Widgets.Scale, Tcl.Tk.Ada.Pack and
  Tcl.Tk.Ada.Widgets.Canvas.Item\_Configure (procedure)
- Typos in code documentation
- Argument `options` for procedure Tcl.Tk.Ada.Widgets.configure

## [8.6.3] - 2020-03-31

### Added
- Binding for Tk `photo` commands: `put`, `read`, `redither`,
  `transparency get`, `transparency set`, `write`
- Binding for Tk `ttk::entry` commands: `delete`, `insert`
- Binding for Tk `tk busy` commands: `cget`, `configure`, `current`, `status`
- Binding for Tk `ttk::style` commands: `lookup`, `element create`,
  `element names`, `element options`
- Binding for Tk `menu` command: `invoke`
- Binding for Tk `canvas` commands: `addtag`, `bbox`, `bind`, `canvasx`,
  `canvasy`, `coords`, `dchars`, `delete`, `dtag`, `find`, `focus`, `gettags`,
  `icursor`, `imove`, `index`, `insert`, `itemcget`, `itemconfigure`, `lower`,
  `move`, `moveto`, `postscript`, `raise`, `rchars`, `scale`, `select adjust`,
  `select clear`, `select from`, `select item`, `select to`, `type`, `xview`,
  `xview moveto`
- Binding for Tk `ttk::panedwindow` command: `insert`
- Binding for Tk commands: `instate`, `state`, `focus`
- Binding for Tk `ttk::treeview` commands: `detach`, `insert` as function,
  `parent`, `next`, `prev`, `focus`
- Binding for Tk `text` commands: `tag add`, `tag configure`, `delete`

### Changed
- Updated README.md
- Updated code documentation

### Fixed
- Configure the library on headless systems (mostly for Docker)
- Typos in contributing guide
- Missing code documentation for Tk `button` and `ttk::button` `invoke` command
- Procedure and function `Unbind` in Tcl.Tk.Ada.Widgets
- Procedure and function `Unbind_From_Main_Window` in
  Tcl.Tk.Ada.Widgets.Toplevel.MainWindow

## [8.6.2] - 2020-02-29

### Added
- Binding for Tk `winfo` command
- Binding for Tk Menu `delete` command
- **BREAKING:** creating relocatable version of library
- Binding for Tk `ttk::treeview` commands: `selection`, `selection add`,
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
- Binding for Tk `ttk::button` widget
- Binding fot Tk `image` command
- Binding for Tk `photo` object
- Binding for Tk `ttk::treeview` widget
- Binding for Tk `panedwindow` widget
- Binding for Tk `scrollbar` widget
- Binding for Tk `scale` widget
- Binding for Tk `menubutton` widget
- Binding for Tk `ttk::progressbar` widget
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
