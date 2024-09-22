CLASS zcl_10_test DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
    " View = structured data type
    DATA connection_full_table TYPE TABLE OF /DMO/I_Connection.
    DATA connection_full_struct TYPE /DMO/I_Connection.

    TYPES: BEGIN OF Person,
            alter type i,
            name type string,
            geburtstag type d,
           END OF Person.
    TYPES Personen TYPE STANDARD TABLE of Person WITH NON-UNIQUE DEFAULT KEY.

ENDCLASS.



CLASS zcl_10_test IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*    TYPES ty_result type i.
*    CONSTANTS pi TYPE p DECIMALS 14 VALUE '3.14159265358979'.
*    DATA result type ty_result.
*    DATA output type string.
*
*    result = sin( '0.5' * pi ).
*
*    DO 100 TIMES.
**     out->write( sy-index ).
*
*      DO sin( sy-index * '0.1' ) * 50 TIMES.
*        output = |{ output }-|.
*      ENDDO.
*      out->write( output ).
*      CLEAR output.
*    ENDDO.


    "DATA tester TYPE REF TO LCL_TESTER.
    "tester = NEW LCL_TESTER(  ).

    "out->write( tester->sinus_ausgabe( 500 ) ).

    "Speichern aller Zeilen in einer Tabelle
    SELECT FROM /DMO/I_Connection
    FIELDS AirlineID, ArrivalTime
    INTO CORRESPONDING FIELDS OF TABLE @connection_full_table.

    "Speichern einer Zeile in einer struct
    SELECT SINGLE FROM /DMO/I_Connection
    FIELDS AirlineID, ArrivalTime
    INTO CORRESPONDING FIELDS OF @connection_full_struct.

*    out->write( connection_full_table ).
*    out->write( connection_full_struct ).

    DATA Linus TYPE Person.
    Linus-name = 'Linus'.
    Linus-alter = '19'.
    Linus-geburtstag = '20041115'.

    DATA Lotta TYPE Person.
    Lotta-name = 'Lotta'.
    Lotta-alter = '17'.
    Lotta-geburtstag = '20070905'.

    DATA Personen_Tabelle TYPE Personen.
    APPEND Linus TO Personen_Tabelle.
    APPEND Lotta TO Personen_Tabelle.
    out->write( Personen_Tabelle ).

  ENDMETHOD.
ENDCLASS.
