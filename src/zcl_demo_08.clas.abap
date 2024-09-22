CLASS zcl_demo_08 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_demo_08 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    SELECT FROM ZI_10_ConnectionWithCarrier
    FIELDS CarrierId, ConnectionId, AirportFromId, AirportToId, \_Flights-flight_date
    WHERE CARRIERId = 'LH'
    INTO TABLE @FINAL(flights).

    "Join von Assoziation noch nicht ausgeführt
    out->write( flights ).
  ENDMETHOD.
ENDCLASS.
