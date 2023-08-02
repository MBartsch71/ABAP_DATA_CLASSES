CLASS ycl_mbh_stringtab_iterator DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES yif_mbh_iterator.
    ALIASES get_next FOR yif_mbh_iterator~get_next.
    ALIASES has_next FOR yif_mbh_iterator~has_next.
    ALIASES get_index FOR yif_mbh_iterator~get_index.

    METHODS constructor IMPORTING content TYPE stringtab.

    METHODS get_content RETURNING VALUE(result) TYPE stringtab.

  PRIVATE SECTION.
    DATA collection TYPE stringtab.
    DATA current_index TYPE i.

    METHODS collection_size RETURNING VALUE(result) TYPE i.

    METHODS increase_index.

ENDCLASS.



CLASS YCL_MBH_STRINGTAB_ITERATOR IMPLEMENTATION.


  METHOD collection_size.
    result = lines( collection ).
  ENDMETHOD.


  METHOD constructor.
    me->collection = content.
  ENDMETHOD.


  METHOD get_content.
    result = collection.
  ENDMETHOD.


  METHOD increase_index.
    current_index = current_index + 1.
  ENDMETHOD.


  METHOD yif_mbh_iterator~get_index.
    result = current_index.
  ENDMETHOD.


  METHOD yif_mbh_iterator~get_next.
    increase_index( ).
    result = ycl_mbh_string=>new( collection[ current_index ] ).
  ENDMETHOD.


  METHOD yif_mbh_iterator~has_next.
    result = xsdbool( current_index < collection_size( ) ).
  ENDMETHOD.
ENDCLASS.
