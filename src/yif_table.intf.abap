INTERFACE yif_table
  PUBLIC .
  TYPES tt_cells TYPE TABLE OF REF TO yif_table_cell WITH DEFAULT KEY.

  "! <p class="shorttext synchronized" lang="en"></p>
  "! Get all cells from table
  "! @parameter r_cells | Table cells <p class="shorttext synchronized" lang="en"></p>
  METHODS get_cells
    RETURNING
      VALUE(r_cells) TYPE tt_cells.

  "! <p class="shorttext synchronized" lang="en"></p>
  "! Get cells from requested row
  "! @parameter row | Requested row <p class="shorttext synchronized" lang="en"></p>
  "! @parameter r_rows | Cells of row <p class="shorttext synchronized" lang="en"></p>
  METHODS get_row
    IMPORTING
      row           TYPE i
    RETURNING
      VALUE(r_rows) TYPE tt_cells.

  "! <p class="shorttext synchronized" lang="en"></p>
  "! Get cells of requested column
  "! @parameter col | Requested column <p class="shorttext synchronized" lang="en"></p>
  "! @parameter r_cols | Cells of column <p class="shorttext synchronized" lang="en"></p>
  METHODS get_col
    IMPORTING
      col           TYPE i
    RETURNING
      VALUE(r_cols) TYPE tt_cells.

  "! <p class="shorttext synchronized" lang="en"></p>
  "! Get value of requested cell
  "! @parameter row | Row number <p class="shorttext synchronized" lang="en"></p>
  "! @parameter col | Column number <p class="shorttext synchronized" lang="en"></p>
  "! @parameter r_value | Value of the cell <p class="shorttext synchronized" lang="en"></p>
  METHODS get_cell_value
    IMPORTING
      row            TYPE i
      col            TYPE i
    RETURNING
      VALUE(r_value) TYPE REF TO data.

  "! <p class="shorttext synchronized" lang="en"></p>
  "! Set value of given cell
  "! @parameter row | Row number <p class="shorttext synchronized" lang="en"></p>
  "! @parameter col | Column number <p class="shorttext synchronized" lang="en"></p>
  "! @parameter value | Value to set <p class="shorttext synchronized" lang="en"></p>
  METHODS set_cell_value
    IMPORTING
      row   TYPE i
      col   TYPE i
      value TYPE any.

ENDINTERFACE.
