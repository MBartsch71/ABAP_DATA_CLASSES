CLASS tc_string DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA cut TYPE REF TO ycl_mbh_string.

    METHODS setup.

    METHODS get_string_length FOR TESTING.

    METHODS reverse_a_string FOR TESTING.

    METHODS convert_to_uppercase FOR TESTING.
    METHODS convert_to_lowercase FOR TESTING.
    METHODS capitalize_the_string FOR TESTING.

    METHODS is_equal_ignore_case_success FOR TESTING.
    METHODS is_equal_ignore_case_error FOR TESTING.

    METHODS is_equal_respect_case_success FOR TESTING.
    METHODS is_equal_respect_case_error FOR TESTING.

    METHODS get_char_at_specific_position FOR TESTING.
    METHODS get_specific_substring FOR TESTING.
    METHODS split_string_at_specific_pos FOR TESTING.
    METHODS split_string_in_half FOR TESTING.

    METHODS concatenate_with_second_string FOR TESTING.
    METHODS iterate_through_a_string FOR TESTING.

    methods count_any_of_given_characters for testing.
    methods string_has_connected_twins for testing.
    methods string_has_pair_letters_twice for testing.
    methods string_contain_sequence for testing.

ENDCLASS.

CLASS tc_string IMPLEMENTATION.

  METHOD setup.
    cut = ycl_mbh_string=>new( |TEST| ).
  ENDMETHOD.

  METHOD get_string_length.
    cl_abap_unit_assert=>assert_equals( exp = 4 act = cut->size( ) ).
  ENDMETHOD.

  METHOD reverse_a_string.
    cl_abap_unit_assert=>assert_equals( exp = |TSET| act = cut->reverse_me( )->value( ) ).
  ENDMETHOD.

  METHOD convert_to_uppercase.
    cut = ycl_mbh_string=>new( |test| ).
    cl_abap_unit_assert=>assert_equals( exp = |TEST| act = cut->uppercase( )->value( ) ).
  ENDMETHOD.

  METHOD convert_to_lowercase.
    cl_abap_unit_assert=>assert_equals( exp = |test| act = cut->lowercase( )->value( ) ).
  ENDMETHOD.

  METHOD capitalize_the_string.
    cl_abap_unit_assert=>assert_equals( exp = |Test| act = cut->capitalize( )->value( ) ).
  ENDMETHOD.

  METHOD is_equal_ignore_case_success.
    cl_abap_unit_assert=>assert_true( act = cut->is_equal_to_ignore_case( ycl_mbh_string=>new( |test| ) ) ).
  ENDMETHOD.

  METHOD is_equal_ignore_case_error.
    cl_abap_unit_assert=>assert_false( act = cut->is_equal_to_ignore_case( ycl_mbh_string=>new( |TAST| ) ) ).
  ENDMETHOD.

  METHOD is_equal_respect_case_success.
    cl_abap_unit_assert=>assert_true( act = cut->is_equal_to_respect_case( ycl_mbh_string=>new( |TEST| ) ) ).
  ENDMETHOD.

  METHOD is_equal_respect_case_error.
    cl_abap_unit_assert=>assert_false( act = cut->is_equal_to_respect_case( ycl_mbh_string=>new( |test| ) ) ).
  ENDMETHOD.

  METHOD get_char_at_specific_position.
    cl_abap_unit_assert=>assert_equals( exp = |E| act = cut->get_char_at( 2 ) quit = cl_aunit_assert=>no ).

    cut = ycl_mbh_string=>new( |TESTER| ).
    cl_abap_unit_assert=>assert_equals( exp = |R| act = cut->get_char_at( -1 ) quit = cl_aunit_assert=>no ).

    cut = ycl_mbh_string=>new( |Test| ).
    cl_abap_unit_assert=>assert_equals( exp = |e| act = cut->get_char_at( 2 ) quit = cl_aunit_assert=>no ).
  ENDMETHOD.

  METHOD get_specific_substring.
    cut = ycl_mbh_string=>new( |Test| ).
    cl_abap_unit_assert=>assert_equals( exp = |es| act = cut->get_substring( from = 2 to = 3 )->value( ) ).
  ENDMETHOD.

  METHOD split_string_at_specific_pos.
    DATA(expected_values) = VALUE stringtab( ( |T| )
                                             ( |EST| ) ).
    cl_abap_unit_assert=>assert_equals( exp = expected_values act = cut->split_string( 1 )  ).
  ENDMETHOD.

  METHOD split_string_in_half.
    DATA(expected_values) = VALUE stringtab( ( |TE| ) ( |ST| ) ).
    cl_abap_unit_assert=>assert_equals( exp = expected_values act = cut->halve( ) quit = cl_aunit_assert=>no ).

    cut = ycl_mbh_string=>new( |TESTS| ).
    expected_values = VALUE #( ( |TE| ) ( |STS| ) ).
    cl_abap_unit_assert=>assert_equals( exp = expected_values act = cut->halve( ) quit = cl_aunit_assert=>no ).
  ENDMETHOD.

  METHOD concatenate_with_second_string.
    cl_abap_unit_assert=>assert_equals( exp = |TESTSTRING| act = cut->concatentate_with( |STRING| )->value( ) ).
  ENDMETHOD.

  METHOD iterate_through_a_string.
    DATA(iterator) = cut->get_iterator( ).
    DATA(result_string) = ycl_mbh_string=>new( || ).

    WHILE iterator->has_next( ).
      result_string = result_string->concatentate_with( CAST ycl_mbh_string( iterator->get_next( ) )->value( ) ).
    ENDWHILE.
    cl_abap_unit_assert=>assert_equals( exp = |TEST| act = result_string->value( ) ).
  ENDMETHOD.

  METHOD count_any_of_given_characters.
    cl_abap_unit_assert=>assert_equals( exp = 3 act = cut->count_characters( ycl_mbh_string=>new( |TE| ) ) ).
  ENDMETHOD.

  METHOD string_has_connected_twins.
    cut = ycl_mbh_string=>new( |TESST| ).
    cl_abap_unit_assert=>assert_true( act = cut->has_connected_twins( ) ).
  ENDMETHOD.

  METHOD string_has_pair_letters_twice.
    cut = ycl_mbh_string=>new( |TESTED| ).
    cl_abap_unit_assert=>assert_true( act = cut->has_pair_letter_twice( ) ).
  ENDMETHOD.

  METHOD string_contain_sequence.
    cl_abap_unit_assert=>assert_true( act = cut->contain_sequence( |es| ) ).
  ENDMETHOD.

ENDCLASS.
