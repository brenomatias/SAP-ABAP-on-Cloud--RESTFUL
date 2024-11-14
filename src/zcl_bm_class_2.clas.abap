CLASS zcl_bm_class_2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_bm_class_2 IMPLEMENTATION.
    METHOD if_oo_adt_classrun~main.
    out->write(
    EXPORTING
        data = 'Welcome to ABAP on Cloud!' ).
    ENDMETHOD.
ENDCLASS.
