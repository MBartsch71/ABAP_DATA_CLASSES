CLASS tc_integer DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA cut TYPE REF TO ycl_mbh_integer.

    METHODS create_object         FOR TESTING.
    METHODS get_value_from_object FOR TESTING.

ENDCLASS.


CLASS tc_integer IMPLEMENTATION.

  METHOD create_object.
    cl_abap_unit_assert=>assert_bound(
        msg = |The object should be bound!|
        act = ycl_mbh_integer=>create( 3 ) ).
  ENDMETHOD.

  METHOD get_value_from_object.
    cut = ycl_mbh_integer=>create( 3 ).
    cl_abap_unit_assert=>assert_equals(
        exp = 3
        act = cut->value( ) ).
  ENDMETHOD.

ENDCLASS.
