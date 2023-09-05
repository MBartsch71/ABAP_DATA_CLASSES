INTERFACE yif_table_cell
  PUBLIC .
  DATA row   TYPE i READ-ONLY.
  DATA col   TYPE i READ-ONLY.
  DATA value TYPE REF TO data READ-ONLY.

  METHODS get_col RETURNING VALUE(col) TYPE i.

  METHODS get_row RETURNING VALUE(row) TYPE i.

  METHODS get_value RETURNING VALUE(r_value) TYPE REF TO data.

  METHODS set_value IMPORTING value TYPE any.

ENDINTERFACE.
