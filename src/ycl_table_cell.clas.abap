CLASS ycl_table_cell DEFINITION
  PUBLIC
  FINAL
  CREATE PRIVATE.

  PUBLIC SECTION.
    INTERFACES yif_table_cell .
    ALIASES get_row   FOR yif_table_cell~get_row.
    ALIASES get_col   FOR yif_table_cell~get_col.
    ALIASES get_value FOR yif_table_cell~get_value.
    ALIASES set_value FOR yif_table_cell~set_value.

    "! <p class="shorttext synchronized" lang="en"></p>
    "! Factory method
    "! @parameter i_row | Table row <p class="shorttext synchronized" lang="en"></p>
    "! @parameter i_col | Table col <p class="shorttext synchronized" lang="en"></p>
    "! @parameter r_result | Table cell object <p class="shorttext synchronized" lang="en"></p>
    CLASS-METHODS new
      IMPORTING
        i_row           TYPE i
        i_col           TYPE i
      RETURNING
        VALUE(r_result) TYPE REF TO ycl_table_cell.

  PRIVATE SECTION.
    METHODS constructor
      IMPORTING
        i_row TYPE i
        i_col TYPE i.

ENDCLASS.


CLASS ycl_table_cell IMPLEMENTATION.

  METHOD new.
    r_result = NEW ycl_table_cell( i_row = i_row i_col = i_col ).
  ENDMETHOD.

  METHOD constructor.
    yif_table_cell~row = i_row.
    yif_table_cell~col = i_col.
  ENDMETHOD.

  METHOD yif_table_cell~get_col.
    col = yif_table_cell~col.
  ENDMETHOD.

  METHOD yif_table_cell~get_row.
    row = yif_table_cell~row.
  ENDMETHOD.

  METHOD yif_table_cell~get_value.
    r_value = yif_table_cell~value.
  ENDMETHOD.

  METHOD yif_table_cell~set_value.
    yif_table_cell~value = REF #( value ).
  ENDMETHOD.

ENDCLASS.
