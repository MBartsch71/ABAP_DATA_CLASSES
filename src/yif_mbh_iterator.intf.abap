INTERFACE yif_mbh_iterator
  PUBLIC .

  METHODS get_index RETURNING VALUE(result) TYPE i.

  METHODS get_next RETURNING VALUE(result) TYPE REF TO object.

  METHODS has_next RETURNING VALUE(result) TYPE abap_bool.

ENDINTERFACE.
