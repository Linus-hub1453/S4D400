CLASS zcl_10_demo_06 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_10_demo_06 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*Tabelle mit einer Spalte
*Deklaration einer 'Liste'
"List <nterger> numbers = new ArrayList<>();
    DATA numbers TYPE TABLE OF i.
*Neue Zeilen einfügen über Ausdruck
    numbers = value #( ( 6 ) ( 7 ) ( 254 ) ).
*Einfügen von Datensätzen
    append 42 to numbers.
    append -3 to numbers.
*Lesen von Datensätzen
    TRY.
      out->write( |Zweite Zahl: { numbers[ 2 ] }| ).
      " Exception Klasse CX
      CATCH CX_SY_ITAB_LINE_NOT_FOUND INTO DATA(x).
      out->write( x->get_text(  ) ).
    ENDTRY.
    IF line_exists( numbers[ lines( numbers ) ] ).
      out->write( | letzte Zahl: { numbers[ lines( numbers ) ] } | ).
    ENDIF.
    " Länge
    out->write( | Länge: { lines( numbers ) } | ).
    out->write( numbers ).

    " Foreach Schleife

    "in java:
    "for(int number: numbers) {
    " if(number >= 0) {
    "   sout(number);
    " }
    "}

    "Eine Spalte in der einspaltigen Tabelle heißt TABLE_LINE

    LOOP AT numbers INTO data(number) WHERE table_line > 0.
      out->write( number ).
      out->write( | Zeile: { sy-tabix } | ).
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
