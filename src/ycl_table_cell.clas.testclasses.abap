CLASS ltc_table_cell DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA cut TYPE REF TO ycl_table_cell.

    METHODS setup.

    METHODS create_cell_at_r1_c1        FOR TESTING.
    METHODS populate_a_cell_with_int    FOR TESTING.
    METHODS populate_a_cell_with_char   FOR TESTING.
    METHODS populate_a_cell_with_string FOR TESTING.
ENDCLASS.


CLASS ltc_table_cell IMPLEMENTATION.

  METHOD setup.
    cut = ycl_table_cell=>new( row = 1 col = 1 ).
  ENDMETHOD.

  METHOD create_cell_at_r1_c1.
    cl_abap_unit_assert=>assert_equals(
        exp = 1
        act = cut->get_row( )
        msg = 'The row number of cell should be 1'
        quit = cl_aunit_assert=>no ).
    cl_abap_unit_assert=>assert_equals(
        exp = 1
        act = cut->get_col(  )
        msg = 'The column number of the cell should be 1.'
        quit = cl_aunit_assert=>no ).
  ENDMETHOD.

  METHOD populate_a_cell_with_char.
    cut->set_value( 'A' ) .

    DATA(valref) = cut->get_value( ).
    ASSIGN valref->* TO FIELD-SYMBOL(<value>).

    cl_abap_unit_assert=>assert_equals(
        exp = 'A'
        act = <value>
        msg = 'The Cell should have the expected value.' ).
  ENDMETHOD.

  METHOD populate_a_cell_with_int.
    cut->set_value( 15 ).
    DATA(valref) = cut->get_value( ).
    ASSIGN valref->* TO FIELD-SYMBOL(<value>).
    cl_abap_unit_assert=>assert_equals(
        exp = 15
        act = <value>
        msg = 'The Cell should have the expected value.' ).
  ENDMETHOD.

  METHOD populate_a_cell_with_string.
    cut->set_value( |Teststring| ).
    DATA(valref) = cut->get_value( ).
    ASSIGN valref->* TO FIELD-SYMBOL(<value>).
    cl_abap_unit_assert=>assert_equals(
        exp = |Teststring|
        act = <value>
        msg = 'The Cell should have the expected value.' ).
  ENDMETHOD.

ENDCLASS.
