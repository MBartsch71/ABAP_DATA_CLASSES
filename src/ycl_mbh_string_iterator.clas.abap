CLASS ycl_mbh_string_iterator DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES yif_mbh_iterator.
    ALIASES get_next FOR yif_mbh_iterator~get_next.
    ALIASES get_index FOR yif_mbh_iterator~get_index.
    ALIASES has_next FOR yif_mbh_iterator~has_next.

    METHODS constructor IMPORTING collection TYPE REF TO ycl_mbh_string.

  PRIVATE SECTION.
    DATA current_index TYPE i VALUE 0.
    DATA collection TYPE REF TO ycl_mbh_string.

    METHODS increase_index.

ENDCLASS.



CLASS YCL_MBH_STRING_ITERATOR IMPLEMENTATION.


  METHOD constructor.
    me->collection = collection.
  ENDMETHOD.


  METHOD increase_index.
    current_index = current_index + 1.
  ENDMETHOD.


  METHOD yif_mbh_iterator~get_index.
    result = current_index.
  ENDMETHOD.


  METHOD yif_mbh_iterator~get_next.
    increase_index( ).
    result = ycl_mbh_string=>new( collection->get_char_at( current_index ) ).
  ENDMETHOD.


  METHOD yif_mbh_iterator~has_next.
    result = xsdbool( current_index < collection->size( ) ).
  ENDMETHOD.
ENDCLASS.
