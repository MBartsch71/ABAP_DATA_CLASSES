CLASS ltc_table DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA cut TYPE REF TO ycl_table.

    METHODS create_table_with_1_row_2_cols FOR TESTING.
    METHODS create_table_with_3_row_4_cols FOR TESTING.
    METHODS get_all_5_fields_from_2nd_row  FOR TESTING.
    METHODS get_all_4_rows_from_3rd_col    FOR TESTING.
    METHODS set_a_value_in_row1_col3       FOR TESTING.

    METHODS exception_get_nonexisting_cell FOR TESTING.
    METHODS exception_set_nonexisting_cell FOR TESTING.

ENDCLASS.


CLASS ltc_table IMPLEMENTATION.

  METHOD create_table_with_1_row_2_cols.
    cut = ycl_table=>new( rows = 1 cols = 2 ).
    cl_abap_unit_assert=>assert_equals(
        exp = 2
        act = lines( cut->get_cells( ) )
        msg = 'The table should have 2 cells.' ).
  ENDMETHOD.

  METHOD create_table_with_3_row_4_cols.
    cut = ycl_table=>new( rows = 3 cols = 4 ).
    cl_abap_unit_assert=>assert_equals(
           exp = 12
           act = lines( cut->get_cells( ) )
           msg = 'The table should have 12 cells.' ).
  ENDMETHOD.

  METHOD get_all_4_rows_from_3rd_col.
    cut = ycl_table=>new( rows = 4 cols = 5 ).
    cl_abap_unit_assert=>assert_equals(
        exp = 4
        act = lines( cut->get_col( 3 ) )
        msg = 'Row 2 should contain 4 fields.' ).
  ENDMETHOD.

  METHOD get_all_5_fields_from_2nd_row.
    cut = ycl_table=>new( rows = 4 cols = 5 ).
    cl_abap_unit_assert=>assert_equals(
        exp = 5
        act = lines( cut->get_row( 2 ) )
        msg = 'Row 2 should contain 5 fields.' ).
  ENDMETHOD.

  METHOD set_a_value_in_row1_col3.
    cut = ycl_table=>new( rows = 5 cols = 6 ).
    cut->set_cell_value( row = 1 col = 3 value = 8 ).

    DATA(valref) = cut->get_cell_value( row = 1 col = 3 ).
    ASSIGN valref->* TO FIELD-SYMBOL(<value>).
    cl_abap_unit_assert=>assert_equals(
        exp = 8
        act = <value>
        msg = 'The table cell should contain the expected value' ).
  ENDMETHOD.

  METHOD exception_get_nonexisting_cell.
    cut = ycl_table=>new( rows = 2 cols = 2 ).
    TRY.
        DATA(value) = cut->get_cell_value( row = 3 col = 2 ).
      CATCH ycx_table_cell_not_found INTO DATA(x_error).
    ENDTRY.
    cl_abap_unit_assert=>assert_bound( act = x_error msg = |The object should be bound!| ).
  ENDMETHOD.

  METHOD exception_set_nonexisting_cell.
    cut = ycl_table=>new( rows = 3 cols = 3 ).
    TRY.
        cut->set_cell_value( row = 4 col = 1 value = 2 ).
      CATCH ycx_table_cell_not_found INTO DATA(x_error).
    ENDTRY.
    cl_abap_unit_assert=>assert_bound( act = x_error msg = |The object should be bound!| ).
  ENDMETHOD.

ENDCLASS.
