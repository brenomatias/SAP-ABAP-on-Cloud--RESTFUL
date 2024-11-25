CLASS lhc_ZUMANAGED_C_TRAVEL_2 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zumanaged_c_travel_2 RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE zumanaged_c_travel_2.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zumanaged_c_travel_2.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zumanaged_c_travel_2.

    METHODS read FOR READ
      IMPORTING keys FOR READ zumanaged_c_travel_2 RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK zumanaged_c_travel_2.

ENDCLASS.

CLASS lhc_ZUMANAGED_C_TRAVEL_2 IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.
  ENDMETHOD.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZUMANAGED_C_TRAVEL_2 DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZUMANAGED_C_TRAVEL_2 IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
