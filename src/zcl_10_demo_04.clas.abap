CLASS zcl_10_demo_04 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_10_demo_04 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA flight_date type /dmo/flight_date VALUE '20240917'.
  DATA carrier_id type /dmo/carrier_id VALUE 'LH'.

*  ------------------------
*  Einfachverzweigungen
*  ------------------------

  "Logische Operatoren: AND, OR, NOT
  "Vergleichsoperatoren: <, <=, >, >=, <>
  IF ( flight_date >= '20240101' AND flight_date < '20250101' ) OR carrier_id <> 'AA'.
    out->write( 'IF 1 erfüllt' ).
  ELSE.
    out->write( ' IF 1 nicht erfüllt' ).
  ENDIF.


  IF flight_date BETWEEN '20240101' AND '20250101'.
    out->write(  'IF 2 erfüllt' ).
  ENDIF.
  "Liegt der Initialwert vor?
  CLEAR carrier_id.
  IF carrier_id IS INITIAL.
    out->write( 'IF 3 erfüllt' ).
  ENDIF.

  " Ausdrücke für Bedingungen

  out->write( COND #( WHEN flight_date BETWEEN '20240101' AND '20241231'
                      THEN 'COND erfüllt'
                      ELSE 'Cond nicht erfüllt') ).

*  ------------------------
*  Fallunterscheidungen
*  ------------------------

  "Switch Case
  carrier_id = 'lh'.
  carrier_id = to_upper( carrier_id ).

  CASE carrier_id.
    WHEN 'LH' OR 'lh'.
      out->write( 'Lufthansa' ).
    WHEN 'AA'.
      out->write( 'American Airlanes' ).
    WHEN OTHERS.
      out->write( carrier_id ).
  ENDCASE.
  out->write( SWITCH #( carrier_id WHEN 'lh' OR 'lH' or 'LH' THEN 'Lufthansa'
                                   WHEN 'aa' THEN 'American Airlines'
                                   ELSE carrier_id ) ).
  ENDMETHOD.
ENDCLASS.
