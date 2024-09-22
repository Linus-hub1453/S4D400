CLASS zcl_10_demo11 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_10_demo11 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    " Deklaration interner Tabellen

    DATA flight   TYPE z10_flight.
    DATA flights  TYPE z10_flights. " TYPE <Tabellentyp>
    DATA flights2 TYPE TABLE OF z10_flight.                " TYPE TABLE OF <Strukturtyp>
    DATA flights3 TYPE TABLE OF /dmo/flight.
    DATA flights4 TYPE Z10_FLIGHTS.

    flight-carrier_id    = 'LH'.
    flight-connection_id = '0401'.
    flight-flight_date   = sy-datlo + 50.

    " Einfügen von Datensätzen
    flights = VALUE #( ( carrier_id = 'LH' connection_id = '0400' )
                       ( flight_date = sy-datlo )
                       ( )
                       ( flight_price = '777.99' currency_code = 'EUR' carrier_id = 'UA' )
                       ( flight )
                       ( flight ) ).

    " Hinzufügen von Datensätzen
    flight-flight_date -= 30.
    APPEND flight TO flights.
    flight-flight_date -= 90.
    flights = VALUE #( BASE flights
                       ( flight ) ).

    " Kopieren interner Tabellen
    flights2 = flights.
    flights3 = CORRESPONDING #( flights ).
    " flights.forEach(f -> System.out.println(f)); flights.forEach(System.out::println);
    " flights.forEach(f -> f.doSomething()); flights.forEach(Flight::doSomething);
    flights4 = VALUE #( FOR f IN flights
                        ( f ) ).

*    out->write( flights ).
*    out->write( flights2 ).
*    out->write( flights3 ).
*    out->write( flights4 ).

    " Lesen von internen Tabellen
    flight = flights[ 3 ]. " per Index
    flight = flights[ carrier_id = 'LH' connection_id = '0401' ]. " per Komponente#
    LOOP AT flights into flight WHERE connection_id > '399'.
    ENDLOOP.

    " Ändern von Datensätzen
    flights[ 3 ]-flight_price = '500'. " per Index
    flights[ carrier_id = 'LH' connection_id = '0401' ]-flight_price = '195.95'. " per Komponente#
*    LOOP AT flights into flight WHERE connection_id > '399'.
*      flight-currency_code = 'EUR'.
*      flights[ sy-tabix ]-currency_code = 'lit'.
*    ENDLOOP.
*    out->write( flights ).
*

    " Referenz: Hilfsvariable der foreach Schleife ist ein Verweis auf die Zeile in der Table
    LOOP AT flights reference INTO data(flight2).
      flight2->currency_code = 'mrt'.
    ENDLOOP.
    out->write( flights ).

    " Löschen von Datensätzen
    DELETE flights INDEX 2.
    DELETE flights WHERE carrier_id IS INITIAL.
    " Sortieren interner Tabellen
    SORT flights2 by carrier_id DESCENDING connection_id ASCENDING flight_date DESCENDING.

  ENDMETHOD.
ENDCLASS.
