INTERFACE yif_table
  PUBLIC .
  TYPES: BEGIN OF cell_entry,
           col  TYPE i,
           row  TYPE i,
           cell TYPE REF TO yif_table_cell,
         END OF cell_entry.
  TYPES cell_map TYPE SORTED TABLE OF cell_entry WITH UNIQUE KEY primary_key COMPONENTS row col
                                                 WITH UNIQUE SORTED KEY sort_by_col COMPONENTS col row.
  TYPES tt_cells TYPE TABLE OF REF TO yif_table_cell WITH DEFAULT KEY.


  "! <p class="shorttext synchronized" lang="en"></p>
  "! Get all cells from table
  "! @parameter result | Table cells <p class="shorttext synchronized" lang="en"></p>
  METHODS get_cells RETURNING VALUE(result) TYPE cell_map.

  "! <p class="shorttext synchronized" lang="en"></p>
  "! Get cells from requested row
  "! @parameter row | Requested row <p class="shorttext synchronized" lang="en"></p>
  "! @parameter result | Cells of row <p class="shorttext synchronized" lang="en"></p>
  METHODS get_row IMPORTING row           TYPE i
                  RETURNING VALUE(result) TYPE cell_map.

  "! <p class="shorttext synchronized" lang="en"></p>
  "! Get cells of requested column
  "! @parameter col | Requested column <p class="shorttext synchronized" lang="en"></p>
  "! @parameter result | Cells of column <p class="shorttext synchronized" lang="en"></p>
  METHODS get_col IMPORTING col           TYPE i
                  RETURNING VALUE(result) TYPE cell_map.

  "! <p class="shorttext synchronized" lang="en"></p>
  "! Get value of requested cell
  "! @parameter row | Row number <p class="shorttext synchronized" lang="en"></p>
  "! @parameter col | Column number <p class="shorttext synchronized" lang="en"></p>
  "! @parameter result | Value of the cell <p class="shorttext synchronized" lang="en"></p>
  METHODS get_cell_value IMPORTING row           TYPE i
                                   col           TYPE i
                         RETURNING VALUE(result) TYPE REF TO data.

  "! <p class="shorttext synchronized" lang="en"></p>
  "! Set value of given cell
  "! @parameter row | Row number <p class="shorttext synchronized" lang="en"></p>
  "! @parameter col | Column number <p class="shorttext synchronized" lang="en"></p>
  "! @parameter value | Value to set <p class="shorttext synchronized" lang="en"></p>
  METHODS set_cell_value IMPORTING row   TYPE i
                                   col   TYPE i
                                   value TYPE any.

ENDINTERFACE.
