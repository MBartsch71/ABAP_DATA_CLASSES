CLASS ycl_mbh_string DEFINITION
  PUBLIC
  CREATE PRIVATE.

  PUBLIC SECTION.
    CLASS-METHODS new IMPORTING content       TYPE string
                      RETURNING VALUE(result) TYPE REF TO ycl_mbh_string.

    METHODS value RETURNING VALUE(result) TYPE string.

    METHODS reverse_me RETURNING VALUE(result) TYPE REF TO ycl_mbh_string.

    METHODS uppercase RETURNING VALUE(result) TYPE REF TO ycl_mbh_string.

    METHODS lowercase RETURNING VALUE(result) TYPE REF TO ycl_mbh_string.

    METHODS capitalize RETURNING VALUE(result) TYPE REF TO ycl_mbh_string.

    METHODS size RETURNING VALUE(result) TYPE i.

    METHODS is_equal_to_ignore_case IMPORTING input         TYPE REF TO ycl_mbh_string
                                    RETURNING VALUE(result) TYPE abap_bool.

    METHODS is_equal_to_respect_case IMPORTING input         TYPE REF TO ycl_mbh_string
                                     RETURNING VALUE(result) TYPE abap_bool.

    METHODS get_char_at IMPORTING position      TYPE i
                        RETURNING VALUE(result) TYPE text1.

    METHODS get_substring IMPORTING from          TYPE i
                                    to            TYPE i
                          RETURNING VALUE(result) TYPE REF TO ycl_mbh_string.

    METHODS split_string IMPORTING at            TYPE i
                         RETURNING VALUE(result) TYPE stringtab.

    METHODS halve RETURNING VALUE(result) TYPE stringtab.

    METHODS constructor IMPORTING internal_value TYPE string.

    METHODS concatentate_with IMPORTING string        TYPE string
                              RETURNING VALUE(result) TYPE REF TO ycl_mbh_string.

    METHODS get_iterator RETURNING VALUE(result) TYPE REF TO yif_mbh_iterator.
    METHODS count_characters
      IMPORTING
        characters    TYPE REF TO ycl_mbh_string
      RETURNING
        VALUE(result) TYPE i.
    METHODS has_pair_letter_twice
      RETURNING
        VALUE(result) TYPE abap_bool.
    METHODS contain_sequence
      IMPORTING
        sequence      TYPE string
      RETURNING
        VALUE(result) TYPE abap_bool.
    METHODS has_connected_twins
      RETURNING
        VALUE(result) TYPE abap_bool.

  PRIVATE SECTION.
    DATA internal_value TYPE string.

    METHODS head RETURNING VALUE(result) TYPE string.

    METHODS tail RETURNING VALUE(result) TYPE string.

    METHODS split_directly RETURNING VALUE(result) TYPE stringtab.

    METHODS split_before_half RETURNING VALUE(result) TYPE stringtab.

    METHODS string_length_is_even RETURNING VALUE(result) TYPE abap_bool.

    METHODS get_half_pos RETURNING VALUE(result) TYPE i.

ENDCLASS.



CLASS ycl_mbh_string IMPLEMENTATION.


  METHOD capitalize.
    result = NEW #( |{ to_upper( head( ) ) }{ to_lower( tail( ) ) }| ).
  ENDMETHOD.


  METHOD concatentate_with.
    result = NEW #( |{ internal_value }{ string }| ).
  ENDMETHOD.


  METHOD constructor.
    me->internal_value = internal_value.
  ENDMETHOD.


  METHOD contain_sequence.
    result = xsdbool( internal_value CS sequence ).
  ENDMETHOD.


  METHOD count_characters.
    DATA(iterator) = CAST ycl_mbh_string_iterator( characters->get_iterator( ) ).
    WHILE iterator->has_next( ).
      DATA(char) = CAST ycl_mbh_string( iterator->get_next( ) ).
      FIND ALL OCCURRENCES OF char->value( ) IN internal_value MATCH COUNT DATA(count).
      result = result + count.
    ENDWHILE.
  ENDMETHOD.


  METHOD get_char_at.
    DATA(offset) = COND i( WHEN position < 0 THEN size( ) + position
                           WHEN position = 0 THEN 0
                           ELSE position - 1 ).
    result = substring( val = internal_value off = offset len = 1 ).
  ENDMETHOD.


  METHOD get_half_pos.
    result = size( ) / 2.
  ENDMETHOD.


  METHOD get_iterator.
    result = NEW ycl_mbh_string_iterator( me ).
  ENDMETHOD.


  METHOD get_substring.
    DATA(starting_pos) = from - 1.
    DATA(length) = to - starting_pos.
    result = NEW #( |{ substring( val = internal_value off = starting_pos len = length ) }| ).
  ENDMETHOD.


  METHOD halve.
    result = COND #( WHEN string_length_is_even( )
                       THEN split_directly( )
                       ELSE split_before_half( ) ).
  ENDMETHOD.


  METHOD has_pair_letter_twice.
    DATA position TYPE i value 1.
    DATA preceeding_pair TYPE char2.

    DATA(last_read_pos) = strlen( internal_value ) - 2.
    WHILE position <= last_read_pos.
      DATA(pair) = get_substring( from = position to = position + 1 ).
      IF pair->value( ) = preceeding_pair.
        result = abap_true.
        RETURN.
      ENDIF.
      preceeding_pair = pair->value( ).
      position = position + 1.
    ENDWHILE.
  ENDMETHOD.


  METHOD has_connected_twins.
    DATA preceeded_string TYPE REF TO ycl_mbh_string.

    preceeded_string = ycl_mbh_string=>new( || ).
    DATA(iterator) = CAST ycl_mbh_string_iterator( get_iterator( ) ).

    WHILE iterator->has_next( ).
      DATA(char) = CAST ycl_mbh_string( iterator->get_next( ) ).
      IF char->value( ) = preceeded_string->value( ).
        result = abap_true.
        RETURN.
      ENDIF.
      preceeded_string = char.
    ENDWHILE.
  ENDMETHOD.


  METHOD head.
    result = internal_value(1).
  ENDMETHOD.


  METHOD is_equal_to_ignore_case.
    result = xsdbool( me->uppercase( )->value( ) = input->uppercase( )->value( ) ).
  ENDMETHOD.


  METHOD is_equal_to_respect_case.
    result = xsdbool( internal_value = input->internal_value ).
  ENDMETHOD.


  METHOD lowercase.
    result = NEW #( |{ to_lower( internal_value ) }| ).
  ENDMETHOD.


  METHOD new.
    result = NEW #( content ).
  ENDMETHOD.


  METHOD reverse_me.
    result = NEW #( |{ reverse( internal_value ) }| ).
  ENDMETHOD.


  METHOD size.
    result = strlen( internal_value ).
  ENDMETHOD.


  METHOD split_before_half.
    DATA(half) = get_half_pos( ).
    result = VALUE #( ( substring( val = internal_value off = 0 len = half - 1 ) )
                      ( substring( val = internal_value off = half - 1 len = half ) ) ).
  ENDMETHOD.


  METHOD split_directly.
    DATA(half) = get_half_pos( ).
    result = VALUE #( ( substring( val = internal_value off = 0 len = half ) )
                      ( substring( val = internal_value off = half len = half ) ) ).
  ENDMETHOD.


  METHOD split_string.
    result = VALUE #( ( substring( val = internal_value off = 0 len = at ) )
                      ( substring( val = internal_value off = at len = strlen( internal_value ) - at ) ) ).
  ENDMETHOD.


  METHOD string_length_is_even.
    result = xsdbool( get_half_pos( ) MOD 2 = 0 ).
  ENDMETHOD.


  METHOD tail.
    result = substring( val = internal_value off = 1 len = size( ) - 1 ).
  ENDMETHOD.


  METHOD uppercase.
    result = NEW #( |{ to_upper( internal_value ) }| ).
  ENDMETHOD.


  METHOD value.
    result = internal_value.
  ENDMETHOD.
ENDCLASS.
