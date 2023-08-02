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
    "! @parameter row | Table row <p class="shorttext synchronized" lang="en"></p>
    "! @parameter col | Table col <p class="shorttext synchronized" lang="en"></p>
    "! @parameter r_result | Table cell object <p class="shorttext synchronized" lang="en"></p>
    CLASS-METHODS new
      IMPORTING
        row             TYPE i
        col             TYPE i
      RETURNING
        VALUE(r_result) TYPE REF TO ycl_table_cell.

  PRIVATE SECTION.

    METHODS constructor
      IMPORTING
        row TYPE i
        col TYPE i.

ENDCLASS.



CLASS YCL_TABLE_CELL IMPLEMENTATION.

  METHOD new.
    r_result = NEW ycl_table_cell( row = row col = col ).
  ENDMETHOD.

  METHOD constructor.
    yif_table_cell~row = row.
    yif_table_cell~col = col.
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
