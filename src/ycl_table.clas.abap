CLASS ycl_table DEFINITION
  PUBLIC
  FINAL
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
    "! @parameter r_result | Table object <p class="shorttext synchronized" lang="en"></p>
    CLASS-METHODS new
      IMPORTING
        rows            TYPE i
        cols            TYPE i
      RETURNING
        VALUE(r_result) TYPE REF TO ycl_table.

  PRIVATE SECTION.
    DATA cells TYPE yif_table=>tt_cells.

    METHODS constructor
      IMPORTING
        rows TYPE i
        cols TYPE i.

ENDCLASS.



CLASS ycl_table IMPLEMENTATION.

  METHOD new.
    r_result = NEW ycl_table( rows = rows cols = cols ).
  ENDMETHOD.

  METHOD constructor.
    cells = VALUE #( FOR current_row = 1 WHILE current_row < rows + 1
                        FOR current_col = 1 WHILE current_col < cols + 1 (
                            ycl_table_cell=>new( row = current_row col = current_col ) ) ).
  ENDMETHOD.

  METHOD yif_table~get_cells.
    r_cells = cells.
  ENDMETHOD.

  METHOD yif_table~get_col.
    r_cols = VALUE #( FOR <cell> IN cells
                          WHERE ( table_line->col = col )
                          ( <cell> ) ).
  ENDMETHOD.

  METHOD yif_table~get_row.
    r_rows = VALUE #( FOR <cell> IN cells
                          WHERE ( table_line->row = row )
                          ( <cell> ) ).
  ENDMETHOD.

  METHOD yif_table~get_cell_value.
    r_value = REDUCE #( INIT value = REF #( 0 )
                        FOR <rowcells> IN get_row( row )
                        NEXT value = SWITCH #( xsdbool( <rowcells>->get_col( ) = col )
                                               WHEN abap_true THEN <rowcells>->get_value( )
                                               ELSE value ) ) .
  ENDMETHOD.

  METHOD yif_table~set_cell_value.
    LOOP AT cells ASSIGNING FIELD-SYMBOL(<line>).
      IF <line>->get_col( ) = col AND <line>->get_row( ) = row.
        <line>->set_value( value ).
        EXIT.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
