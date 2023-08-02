CLASS ycl_mbh_integer DEFINITION
  PUBLIC
  CREATE PRIVATE.

  PUBLIC SECTION.
    CLASS-METHODS create IMPORTING value         TYPE i
                         RETURNING VALUE(result) TYPE REF TO ycl_mbh_integer.

    METHODS constructor IMPORTING internal_value TYPE i.

    METHODS value RETURNING VALUE(result) TYPE integer.

  PRIVATE SECTION.
    DATA internal_value TYPE i.

ENDCLASS.

CLASS ycl_mbh_integer IMPLEMENTATION.

  METHOD constructor.
    me->internal_value = internal_value.
  ENDMETHOD.

  METHOD create.
    result = NEW ycl_mbh_integer( value ).
  ENDMETHOD.

  METHOD value.
    result = internal_value.
  ENDMETHOD.

ENDCLASS.
