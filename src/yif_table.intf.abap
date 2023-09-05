INTERFACE yif_table
  PUBLIC .
  TYPES tt_cells TYPE TABLE OF REF TO yif_table_cell WITH DEFAULT KEY.

  METHODS get_cells RETURNING VALUE(r_cells) TYPE tt_cells.

  METHODS get_row IMPORTING row           TYPE i
                  RETURNING VALUE(r_rows) TYPE tt_cells.

  METHODS get_col IMPORTING col           TYPE i
                  RETURNING VALUE(r_cols) TYPE tt_cells.

  METHODS get_cell_value IMPORTING row            TYPE i
                                   col            TYPE i
                         RETURNING VALUE(r_value) TYPE REF TO data.

  METHODS set_cell_value IMPORTING row   TYPE i
                                   col   TYPE i
                                   value TYPE any.

ENDINTERFACE.
