CLASS ltc_table DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA mo_cut TYPE REF TO ycl_table.

    METHODS create_table_with_1_row_2_cols FOR TESTING.
    METHODS create_table_with_3_row_4_cols FOR TESTING.
    METHODS get_all_5_fields_from_2nd_row  FOR TESTING.
    METHODS get_all_4_rows_from_3rd_col    FOR TESTING.
    methods set_a_value_in_row1_col3       for testing.
ENDCLASS.


CLASS ltc_table IMPLEMENTATION.

  METHOD create_table_with_1_row_2_cols.
    mo_cut = ycl_table=>new( rows = 1 cols = 2 ).
    cl_abap_unit_assert=>assert_equals(
        exp = 2
        act = lines( mo_cut->get_cells( ) )
        msg = 'The table should have 4 cells.' ).
  ENDMETHOD.

  METHOD create_table_with_3_row_4_cols.
    mo_cut = ycl_table=>new( rows = 3 cols = 4 ).
    cl_abap_unit_assert=>assert_equals(
           exp = 12
           act = lines( mo_cut->get_cells( ) )
           msg = 'The table should have 12 cells.' ).
  ENDMETHOD.

  METHOD get_all_4_rows_from_3rd_col.
    mo_cut = ycl_table=>new( rows = 4 cols = 5 ).
    cl_abap_unit_assert=>assert_equals(
        exp = 4
        act = lines( mo_cut->get_col( 3 ) )
        msg = 'Row 2 should contain 5 fields.' ).
  ENDMETHOD.

  METHOD get_all_5_fields_from_2nd_row.
    mo_cut = ycl_table=>new( rows = 4 cols = 5 ).
    cl_abap_unit_assert=>assert_equals(
        exp = 5
        act = lines( mo_cut->get_row( 2 ) )
        msg = 'Row 2 should contain 5 fields.' ).
  ENDMETHOD.

  METHOD set_a_value_in_row1_col3.
    mo_cut = ycl_table=>new( rows = 5 cols = 6 ).
    mo_cut->set_cell_value( row = 1 col = 3 value = 8 ).

    DATA(valref) = mo_cut->get_cell_value( row = 1 col = 3 ).
    ASSIGN valref->* TO FIELD-SYMBOL(<value>).
    cl_abap_unit_assert=>assert_equals(
        exp = 8
        act = <value>
        msg = 'The table cell should contain the expected value' ).
  ENDMETHOD.

ENDCLASS.
