CLASS zcl_10_demo_02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_10_demo_02 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  DATA result TYPE i.
  DATA result2 TYPE p length 16 decimals 4.
  result = 5 + 3.
*  out->write( result ).
  result = 5 - 3.
*  out->write( result ).
  result = 5 * 3.
*  out->write( result ).
  "Rundung bei Integer auf 2
  result = 5 / 3.
*  out->write( result ).
  result2 = 5 / 3.
*  out->write( result2 ).

  result2 = 5 DIV 3.
  result2 = 5 MOD 3.
  "out->write( result2 ).

  "built-in function: "round"
  "Schlüsselwortparameter"

  result = round( val = '8.875'  dec = 2 ).
  "out->write(  result ).

  "Inkrementieren / Dekrementieren
  CLEAR result.
  result = result + 1.
  result += 1.
  out->write( result ).
  IF 2 = result.
    out->write( 'true' ).
  ENDIF.

  ENDMETHOD.
ENDCLASS.
