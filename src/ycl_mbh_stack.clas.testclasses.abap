CLASS tc_stack DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA cut TYPE REF TO ycl_mbh_stack.

    METHODS setup.
    METHODS add_three_items_to_stack.

    METHODS return_true_for_an_empty_stack FOR TESTING.

    METHODS add_3_objects_to_the_stack FOR TESTING.
    METHODS add_3_objects_get_the_top_one FOR TESTING.
    METHODS peek_topmost_object FOR TESTING.

ENDCLASS.

CLASS tc_stack IMPLEMENTATION.

  METHOD setup.
    cut = NEW #( ).
  ENDMETHOD.

  METHOD add_three_items_to_stack.
    cut->push( ycl_mbh_string=>new( |First stack item| ) ).
    cut->push( ycl_mbh_string=>new( |Second stack item| ) ).
    cut->push( ycl_mbh_string=>new( |Third stack item| ) ).
  ENDMETHOD.

  METHOD return_true_for_an_empty_stack.
    cl_abap_unit_assert=>assert_true( act = cut->is_empty( ) ).
  ENDMETHOD.

  METHOD add_3_objects_to_the_stack.
    add_three_items_to_stack( ).
    cl_abap_unit_assert=>assert_equals( exp = 3 act = cut->size( ) ).
  ENDMETHOD.

  METHOD add_3_objects_get_the_top_one.
    add_three_items_to_stack( ).

    DATA(item) = CAST ycl_mbh_string( cut->pop( ) ).

    cl_abap_unit_assert=>assert_equals( exp = |Third stack item| act = item->value( ) ).
    cl_abap_unit_assert=>assert_equals( exp = 2 act = cut->size( ) ).
  ENDMETHOD.

  METHOD peek_topmost_object.
    add_three_items_to_stack( ).
    DATA(item) = CAST ycl_mbh_string( cut->peek( ) ).
    cl_abap_unit_assert=>assert_equals( exp = |Third stack item| act = item->value( )  ).
    cl_abap_unit_assert=>assert_equals( exp = 3 act = cut->size( ) ).
  ENDMETHOD.

ENDCLASS.
