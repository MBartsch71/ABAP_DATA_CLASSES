INTERFACE yif_table_cell
  PUBLIC .
  DATA row   TYPE i READ-ONLY.
  DATA col   TYPE i READ-ONLY.
  DATA value TYPE REF TO data READ-ONLY.

  "! <p class="shorttext synchronized" lang="en"></p>
  "! Get column number of the cell
  "! @parameter col | Column number <p class="shorttext synchronized" lang="en"></p>
  METHODS get_col
    RETURNING
      VALUE(col) TYPE i.

  "! <p class="shorttext synchronized" lang="en"></p>
  "! Get row number of the cell
  "! @parameter row | Row number <p class="shorttext synchronized" lang="en"></p>
  METHODS get_row
    RETURNING
      VALUE(row) TYPE i.

  "! <p class="shorttext synchronized" lang="en"></p>
  "! Get current value of the cell
  "! @parameter r_value | Value <p class="shorttext synchronized" lang="en"></p>
  METHODS get_value
    RETURNING
      VALUE(r_value) TYPE REF TO data.

  "! <p class="shorttext synchronized" lang="en"></p>
  "! Set new value to the cell
  "! @parameter value | Value <p class="shorttext synchronized" lang="en"></p>
  METHODS set_value
    IMPORTING
      value TYPE any.

ENDINTERFACE.
