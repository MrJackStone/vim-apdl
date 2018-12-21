This is my personal fork of https://github.com/andrelfpinto/vim-apdl. 

## Features:

* Syntax highlighting for ANSYS APDL files. (Nothing fancy, just comment, numbers and function names.)
* Indentation rules (*if, *elseif, *do, etc...)
* Autocompletetion of commands and elements

## Added feature

* mapping for opening of an input file that is called with /input, (/inp) command.
  * "localleader vsp" opens the file with a vertical split to the left hand side and moves the cursor to the next row
  * "localleader sp" opens the file with split below the left hand side window (if any)
  * The usual usage is when main script has lots of /inp commands. These can be quickly opened with the mappings.
