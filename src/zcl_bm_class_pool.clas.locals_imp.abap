*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS zcl_earth DEFINITION.
  PUBLIC SECTION.
    METHODS: leave_orbit EXPORTING VALUE(rvalue) TYPE string.
ENDCLASS.
CLASS zcl_earth IMPLEMENTATION.
  METHOD leave_orbit.
    rvalue = 'The Satellite is leaving Earths orbit'.
  ENDMETHOD.
ENDCLASS.
CLASS zcl_mars DEFINITION.
  PUBLIC SECTION.
    METHODS: enter_orbit EXPORTING VALUE(rvalue) TYPE string.
    METHODS: leave_orbit EXPORTING VALUE(rvalue) TYPE string.
ENDCLASS.

CLASS zcl_mars IMPLEMENTATION.
  METHOD leave_orbit.
    rvalue = 'The Satellite is leaving Mars orbit'.
  ENDMETHOD.
  METHOD enter_orbit.
    rvalue = 'The Satellite is entering Mars orbit'.
  ENDMETHOD.
ENDCLASS.

CLASS zcl_jupiter DEFINITION.
  PUBLIC SECTION.
    METHODS: land_orbit EXPORTING VALUE(rvalue) TYPE string.
    METHODS: enter_orbit EXPORTING VALUE(rvalue) TYPE string.
ENDCLASS.
CLASS zcl_jupiter IMPLEMENTATION.
  METHOD land_orbit.
    rvalue = 'The Satellite is landing on Jupiter'.
  ENDMETHOD.
  METHOD enter_orbit.
    rvalue = 'The Satellite is entering Jupiters orbit'.
  ENDMETHOD.
ENDCLASS.
