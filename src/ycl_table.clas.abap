CLASS ycl_table DEFINITION
  PUBLIC
  FINAL
  CREATE PRIVATE .

  PUBLIC SECTION.

    INTERFACES yif_table .

    ALIASES get_cells FOR yif_table~get_cells.
    ALIASES get_row   FOR yif_table~get_row.
    ALIASES get_col   FOR yif_table~get_col.

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

    DATA mt_cells TYPE yif_table=>tt_cells.
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
    mt_cells = VALUE #( FOR current_row = 1 WHILE current_row < rows + 1
                        FOR current_col = 1 WHILE current_col < cols + 1 (
                            ycl_table_cell=>new( row = current_row col = current_col ) ) ).
  ENDMETHOD.

  METHOD yif_table~get_cells.
    r_cells = mt_cells.
  ENDMETHOD.

  METHOD yif_table~get_col.
    r_cols = VALUE #( FOR <line> IN mt_cells
                          WHERE ( table_line->col = col )
                          ( <line> ) ).
  ENDMETHOD.

  METHOD yif_table~get_row.
    r_rows = VALUE #( FOR <line> IN mt_cells
                          WHERE ( table_line->row = row )
                          ( <line> ) ).
  ENDMETHOD.

ENDCLASS.
