CLASS ycl_table DEFINITION
  PUBLIC
  CREATE PRIVATE .

  PUBLIC SECTION.
    INTERFACES yif_table .
    ALIASES get_cells      FOR yif_table~get_cells.
    ALIASES get_row        FOR yif_table~get_row.
    ALIASES get_col        FOR yif_table~get_col.
    ALIASES get_cell_value FOR yif_table~get_cell_value.
    ALIASES set_cell_value FOR yif_table~set_cell_value.

    "! <p class="shorttext synchronized" lang="en"></p>
    "! Factory for Table
    "! @parameter rows | Required rows <p class="shorttext synchronized" lang="en"></p>
    "! @parameter cols | Required columns <p class="shorttext synchronized" lang="en"></p>
    "! @parameter result | Table object <p class="shorttext synchronized" lang="en"></p>
    CLASS-METHODS new IMPORTING rows          TYPE i
                                cols          TYPE i
                      RETURNING VALUE(result) TYPE REF TO ycl_table.

  PRIVATE SECTION.
    DATA cell_map TYPE yif_table=>cell_map.

    METHODS constructor IMPORTING rows TYPE i
                                  cols TYPE i.

ENDCLASS.

CLASS ycl_table IMPLEMENTATION.

  METHOD new.
    result = NEW ycl_table( rows = rows cols = cols ).
  ENDMETHOD.

  METHOD constructor.
    cell_map = VALUE #( FOR current_row = 1 WHILE current_row <= rows
                        FOR current_col = 1 WHILE current_col <= cols
                       (  row = current_row
                          col = current_col
                          cell = ycl_table_cell=>new( row = current_row col = current_col ) ) ).
  ENDMETHOD.

  METHOD yif_table~get_cells.
    result = cell_map.
  ENDMETHOD.

  METHOD yif_table~get_col.
    result = VALUE #( FOR cell IN cell_map USING KEY sort_by_col WHERE ( col = col )
                          ( cell ) ).
  ENDMETHOD.

  METHOD yif_table~get_row.
    result = VALUE #( FOR cell IN cell_map WHERE ( row = row )
                          ( cell ) ).
  ENDMETHOD.

  METHOD yif_table~get_cell_value.
    TRY.
        result = cell_map[ col = col row = row ]-cell->get_value( ).
      CATCH cx_sy_itab_line_not_found.
        RAISE EXCEPTION NEW ycx_table_cell_not_found( ).
    ENDTRY.
  ENDMETHOD.

  METHOD yif_table~set_cell_value.
    TRY.
        cell_map[ col = col row = row ]-cell->set_value( value ).
      CATCH cx_sy_itab_line_not_found.
        RAISE EXCEPTION NEW ycx_table_cell_not_found( ).
    ENDTRY.
  ENDMETHOD.

ENDCLASS.
