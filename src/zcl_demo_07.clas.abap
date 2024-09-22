CLASS zcl_demo_07 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_demo_07 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA carrier_id TYPE /dmo/carrier_id VALUE 'LH'.
    DATA flight_price TYPE /dmo/flight_price.
    DATA flight_prices TYPE TABLE OF /dmo/flight_price.
    DATA flights TYPE TABLE OF /dmo/flight.

  " SELECT <Spalte 1>, <Spalte 2>, ...
  " FROM
  " <Datenbankquelle>
  " WHERE <Bedingung>
  " Lesender Zugriff auf einen Datensatz
    " Ein Datensatz als Ergebnis (SINGLE) -> erstes Ergebnis wird ausgegeben
    "ABAP SQL
    SELECT SINGLE FROM /dmo/flight
      FIELDS price
      WHERE carrier_id = @carrier_id AND connection_id = '0000' AND flight_date = '20340707'
      INTO @flight_price.
    IF sy-subrc <> 0.
      out->write( 'nix gefunden' ).
    ENDIF.
    SELECT FROM /dmo/flight
      FIELDS *
      WHERE carrier_id = @carrier_id
      INTO TABLE @flights.

   SELECT FROM /dmo/flight
    FIELDS price
     WHERE carrier_id = @carrier_id
     INTO TABLE @flight_prices. " @DATA(flight_prices).

    out->write( flight_price ).
    out->write( flight_prices ).
    out->write( flights ).
  ENDMETHOD.
ENDCLASS.
