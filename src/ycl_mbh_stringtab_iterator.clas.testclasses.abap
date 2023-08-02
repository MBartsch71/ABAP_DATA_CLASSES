CLASS tc_stringtab_iterator DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA cut TYPE REF TO ycl_mbh_stringtab_iterator.

    METHODS setup.
    METHODS create_object_with_content FOR TESTING.
    METHODS get_index_after_2_iterations FOR TESTING.
    METHODS create_stringtab_with_iterator FOR TESTING.
ENDCLASS.

CLASS tc_stringtab_iterator IMPLEMENTATION.

  METHOD setup.
    DATA(input) = VALUE stringtab( ( |First line.| )
                                  ( |Second line.| )
                                  ( |Third line.| ) ).
    cut = NEW #( input ).
  ENDMETHOD.

  METHOD create_object_with_content.
    DATA(expected_values) = VALUE stringtab( ( |First line.| )
                                             ( |Second line.| )
                                             ( |Third line.| ) ).
    cl_abap_unit_assert=>assert_equals( exp = expected_values act = cut->get_content( ) ).
  ENDMETHOD.

  METHOD get_index_after_2_iterations.
    cut->yif_mbh_iterator~get_next( ).
    cut->yif_mbh_iterator~get_next( ).
    cl_abap_unit_assert=>assert_equals( exp = 2 act = cut->yif_mbh_iterator~get_index( ) ).
  ENDMETHOD.

  METHOD create_stringtab_with_iterator.
    DATA resulttab TYPE stringtab.
    WHILE cut->yif_mbh_iterator~has_next( ).
      resulttab = VALUE #( BASE resulttab ( CAST ycl_mbh_string( cut->yif_mbh_iterator~get_next( ) )->value( ) ) ).
    ENDWHILE.
    DATA(expected_values) = VALUE stringtab( ( |First line.| )
                                             ( |Second line.| )
                                             ( |Third line.| ) ).
    cl_abap_unit_assert=>assert_equals( exp = expected_values act = resulttab ).
  ENDMETHOD.

ENDCLASS.
