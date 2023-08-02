CLASS tc_iterator DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA cut TYPE REF TO ycl_mbh_string_iterator.

    METHODS setup.

    METHODS get_first_letter_from_string FOR TESTING.
    METHODS get_fully_string_no_error    FOR TESTING.

ENDCLASS.

CLASS tc_iterator IMPLEMENTATION.

  METHOD setup.
    cut = NEW #( ycl_mbh_string=>new( |Teststring| ) ).
  ENDMETHOD.

  METHOD get_first_letter_from_string.
    DATA(result_string) = CAST ycl_mbh_string( cut->get_next( ) ).
    cl_abap_unit_assert=>assert_equals( exp = |T| act = result_string->value( )  ).
  ENDMETHOD.

  METHOD get_fully_string_no_error.
    DATA result_string TYPE string.
    WHILE cut->yif_mbh_iterator~has_next( ).
      result_string = |{ result_string }{ CAST ycl_mbh_string( cut->get_next( ) )->value( ) }|.
    ENDWHILE.
    cl_abap_unit_assert=>assert_equals( exp = |Teststring| act = result_string  ).
  ENDMETHOD.

ENDCLASS.
