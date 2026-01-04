CLASS ycl_mbh_integer DEFINITION
  PUBLIC
  CREATE PRIVATE.

  PUBLIC SECTION.
    CLASS-METHODS create IMPORTING value         TYPE i
                         RETURNING VALUE(result) TYPE REF TO ycl_mbh_integer.

    METHODS value RETURNING VALUE(result) TYPE integer.

  PRIVATE SECTION.
    DATA internal_value TYPE i.
ENDCLASS.


CLASS ycl_mbh_integer IMPLEMENTATION.

  METHOD create.
    result = NEW ycl_mbh_integer( ).
    result->internal_value = value.
  ENDMETHOD.

  METHOD value.
    result = internal_value.
  ENDMETHOD.

ENDCLASS.
