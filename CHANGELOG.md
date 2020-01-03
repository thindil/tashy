# Changelog
All notable changes to this project will be documented in this file.
Tag **BREAKING:** means that change breaks compatybility with ealier version
of the project.

## [Unreleased]

### Added
- Menu widget
- Binding for Tk `wm` command
- Binding for Tk `ttk:button` widget

### Changed
- Enabled Get\_Main\_Window function
- Updated README.md

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
