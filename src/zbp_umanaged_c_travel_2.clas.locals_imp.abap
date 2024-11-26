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

    METHODS map_data IMPORTING im_data            TYPE zumanaged_c_travel_2
                     RETURNING VALUE(r_bapi_data) TYPE /dmo/s_travel_in.

    METHODS set_booked FOR MODIFY IMPORTING keys FOR ACTION
        zumanaged_c_travel_2~set_booked RESULT results.

ENDCLASS.

CLASS lhc_ZUMANAGED_C_TRAVEL_2 IMPLEMENTATION.

  METHOD map_data.
    r_bapi_data-agency_id = im_data-AgencyId .
    r_bapi_data-begin_date = im_data-BeginDate .
    r_bapi_data-booking_fee = im_data-BookingFee .
    r_bapi_data-currency_code = im_data-CurrencyCode .
    r_bapi_data-customer_id = im_data-CustomerId .
    r_bapi_data-description = im_data-Description .
    r_bapi_data-end_date = im_data-EndDate .
    r_bapi_data-status = im_data-Status .
    r_bapi_data-total_price = im_data-TotalPrice .
  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.
    DATA: ls_travel_in  TYPE /dmo/s_travel_in,
          ls_travel_out TYPE /dmo/travel,
          lt_messages   TYPE /dmo/t_message.
    LOOP AT entities ASSIGNING FIELD-SYMBOL(<fs_travel_create>).
      ls_travel_in = map_data( im_data = CORRESPONDING #( <fs_travel_create> ) ).
      CALL FUNCTION '/DMO/FLIGHT_TRAVEL_CREATE'
        EXPORTING
          is_travel   = ls_travel_in
        IMPORTING
          es_travel   = ls_travel_out
          et_messages = lt_messages.
      IF lt_messages IS INITIAL.
        INSERT VALUE #( %cid = <fs_travel_create>-%cid
                        travelid = ls_travel_out-travel_id )
                      INTO TABLE mapped-zumanaged_c_travel_2.
      ELSE.
        LOOP AT lt_messages TRANSPORTING NO FIELDS WHERE msgty = 'E' OR msgty = 'A'.
          INSERT VALUE #( %cid = <fs_travel_create>-%cid ) INTO TABLE failed-zumanaged_c_travel_2.
          RETURN.
        ENDLOOP.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD set_booked.
    DATA: ls_travel_in TYPE /dmo/s_travel_in,
          ls_travel_x  TYPE /dmo/s_travel_inx,
          lt_messages  TYPE /dmo/t_message.
    LOOP AT keys ASSIGNING FIELD-SYMBOL(<status_b>).
      ls_travel_in = map_data( im_data = CORRESPONDING #( <status_b> ) ).
*Update status to B (Booked)
      ls_travel_in-status = 'B'.
* ls_travel_x structure should be filled with respective %control field values
      CLEAR: ls_travel_x-agency_id,
             ls_travel_x-begin_date ,
             ls_travel_x-booking_fee ,
             ls_travel_x-currency_code,
             ls_travel_x-customer_id,
             ls_travel_x-description ,
             ls_travel_x-end_date ,
             ls_travel_x-total_price.
      ls_travel_x-status = 'X'.

      ls_travel_in-travel_id = <status_b>-TravelId.
      ls_travel_x-travel_id = <status_b>-TravelId.
      CALL FUNCTION '/DMO/FLIGHT_TRAVEL_UPDATE'
        EXPORTING
          is_travel   = ls_travel_in
          is_travelx  = ls_travel_x
*         it_booking  =
*         it_bookingx =
*         it_booking_supplement  =
*         it_booking_supplementx =
        IMPORTING
*         es_travel   =
*         et_booking  =
*         et_booking_supplement  =
          et_messages = lt_messages.
      LOOP AT lt_messages TRANSPORTING NO FIELDS WHERE msgty = 'E' OR msgty = 'A'.
        INSERT VALUE #( %cid = <status_b>-%cid_ref travelid = <status_b>-TravelId ) INTO TABLE failed-zumanaged_c_travel_2.
        RETURN.
      ENDLOOP.
    ENDLOOP.
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
    CALL FUNCTION '/DMO/FLIGHT_TRAVEL_SAVE'.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
