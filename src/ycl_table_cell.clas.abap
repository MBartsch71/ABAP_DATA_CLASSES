CLASS ycl_table_cell DEFINITION
  PUBLIC
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
    "! @parameter result | Table cell object <p class="shorttext synchronized" lang="en"></p>
    CLASS-METHODS new IMPORTING row           TYPE i
                                col           TYPE i
                      RETURNING VALUE(result) TYPE REF TO ycl_table_cell.

  PRIVATE SECTION.
    METHODS constructor IMPORTING row TYPE i
                                  col TYPE i.

ENDCLASS.


CLASS ycl_table_cell IMPLEMENTATION.

  METHOD new.
    result = NEW ycl_table_cell( row = row col = col ).
  ENDMETHOD.

  METHOD constructor.
    yif_table_cell~row = row.
    yif_table_cell~col = col.
  ENDMETHOD.

  METHOD yif_table_cell~get_col.
    result = yif_table_cell~col.
  ENDMETHOD.

  METHOD yif_table_cell~get_row.
    result = yif_table_cell~row.
  ENDMETHOD.

  METHOD yif_table_cell~get_value.
    result = yif_table_cell~value.
  ENDMETHOD.

  METHOD yif_table_cell~set_value.
    yif_table_cell~value = REF #( value ).
  ENDMETHOD.

ENDCLASS.
