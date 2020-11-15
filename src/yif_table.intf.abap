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

ENDINTERFACE.
