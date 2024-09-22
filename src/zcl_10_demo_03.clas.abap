CLASS zcl_10_demo_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_10_demo_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA word1 TYPE string VALUE '1'.
    DATA word2 TYPE string VALUE '2'.
    "Strings werden automatisch in Zahlen umgewandelt
    out->write( word1 + word2 ).

    DATA word3 TYPE string VALUE 'Hello'.
    DATA word4 TYPE string VALUE 'World'.
    DATA result TYPE string.
    result &&= word1.
    "Konkatenation
    out->write( word3 && word4 ).

    "mehrere Spaces übernehmen
    "String Templates
    out->write( |{ word3 }     { word4 }| ).

    DATA date TYPE d VALUE ''.
  ENDMETHOD.
ENDCLASS.
