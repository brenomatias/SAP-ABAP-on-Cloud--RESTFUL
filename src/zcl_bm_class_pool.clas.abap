CLASS zcl_bm_class_pool DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: itab TYPE TABLE OF string.
    INTERFACES if_oo_adt_classrun.
    METHODS reachtojupiter.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_bm_class_pool IMPLEMENTATION.
    METHOD reachtojupiter.
      DATA: lv_str TYPE string.
      " For this we'll create 3 local classes for Earth, Mars and Jupiter in Local Types section
      DATA(lo_earth) = new zcl_earth( ).
      DATA(lo_mars) = new zcl_mars( ).
      DATA(lo_jupiter) = new zcl_jupiter( ).
      "Leave Earth's orbit
      lo_earth->leave_orbit( IMPORTING rvalue = lv_str ).
      APPEND lv_str TO itab.
      "Enter Mars orbit
      lo_mars->enter_orbit( IMPORTING rvalue = lv_str ).
      APPEND lv_str TO itab.
      "Leave Mars
      lo_mars->leave_orbit( IMPORTING rvalue = lv_str ).
      APPEND lv_str TO itab.
      "Enter Jupiter Orbit
      lo_jupiter->enter_orbit( IMPORTING rvalue = lv_str ).
      APPEND lv_str TO itab.
      "Land on Jupiter
      lo_jupiter->land_orbit( IMPORTING rvalue = lv_str ).
      APPEND lv_str TO itab.
    ENDMETHOD.
    METHOD if_oo_adt_classrun~main.
    me->reachtojupiter( ).
        out->write(
          EXPORTING
            data   = itab
*            name   =
*          RECEIVING
*            output =
        ).
    ENDMETHOD.
ENDCLASS.
