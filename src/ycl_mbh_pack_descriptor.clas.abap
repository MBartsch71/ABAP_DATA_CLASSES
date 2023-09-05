CLASS ycl_mbh_pack_descriptor DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_apack_manifest.
    METHODS constructor.

ENDCLASS.

CLASS ycl_mbh_pack_descriptor IMPLEMENTATION.

  METHOD constructor.
    if_apack_manifest~descriptor = VALUE #( group_id   = 'MBH_DEV'
                                            artifact_id = 'ABAP_DATA_CLASSES'
                                            version     = '0.1'
                                            git_url     = 'https://github.com/MBartsch71/ABAP_DATA_CLASSES.git' ).
  ENDMETHOD.
ENDCLASS.
