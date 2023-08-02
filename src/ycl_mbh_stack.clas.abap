CLASS ycl_mbh_stack DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS size RETURNING VALUE(result) TYPE i.

    METHODS is_empty RETURNING VALUE(result) TYPE abap_bool.

    METHODS push IMPORTING item TYPE REF TO object.

    METHODS pop RETURNING VALUE(result) TYPE REF TO object.

    METHODS peek RETURNING VALUE(result) TYPE REF TO object.

  PRIVATE SECTION.
    DATA content TYPE STANDARD TABLE OF REF TO object WITH EMPTY KEY.

    METHODS get_top_item RETURNING VALUE(result) TYPE REF TO object.

    METHODS delete_top_item.

ENDCLASS.

CLASS ycl_mbh_stack IMPLEMENTATION.

  METHOD size.
    result = lines( content ).
  ENDMETHOD.

  METHOD is_empty.
    result = xsdbool( lines( content ) = 0 ).
  ENDMETHOD.

  METHOD push.
    INSERT item INTO content INDEX 1.
  ENDMETHOD.

  METHOD pop.
    result = get_top_item( ).
    delete_top_item( ).
  ENDMETHOD.

  METHOD peek.
    result = get_top_item( ).
  ENDMETHOD.

  METHOD get_top_item.
    result = content[ 1 ].
  ENDMETHOD.

  METHOD delete_top_item.
    DELETE content INDEX 1.
  ENDMETHOD.

ENDCLASS.
