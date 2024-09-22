CLASS zcl_10_hello_world DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.


ENDCLASS.



CLASS zcl_10_hello_world IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    "----------------
    " Datentypen
    "----------------
    " Definition Datentyp

    " Zeichenketten

    TYPES ty_first_name TYPE string. "dynamische Zeichenkette
    TYPES ty_last_name TYPE c LENGTH 20. "statische Zeichenkette
    TYPES ty_iuser TYPE n LENGTH 6. "numerische Zeichenkette, ascii

    " Dates


    TYPES ty_birth_date TYPE d. "numerische Folge der Länge 8 YYYYMMDD 19820104
    TYPES ty_birth_time TYPE t. "sechstellig_ HHMMSS 043023

    " Ganze Zahlen

    TYPES ty_number type i. "Integer, Beispiel: "

    " Kommazahlen mit Rundungs
    types ty_salary_in_euro type p length 16 decimals 2.
    "Kommazahl der Größe 16 byte und 2 Nachkommastellen
    "Bsp.: '54623.88'
    "Menge an Stellen vor dem Komma: 16*2 - 1 (Vorzeichen) - 2 (Decimals)

    " 'Boolscher Wahrheitswert' existiert nicht
    types ty_error_flag type c length 1. " Bsp. 'X' ''

    "----------------
    "Deklaration und Wertzuweisung
    "----------------

    DATA first_name TYPE string.
    DATA last_name type ty_last_name.
    DATA iuser VALUE '054906'.
    "DATA ( birth_date ) = '20041511'.

    DATA birth_city type /dmo/airport_id.
    "Initialwert: ''

    first_name = 'Daniel'.
    last_name = 'Appenmaier'.

    iuser = '123456'.
    "Unveränderlich, Konstante
    Constants pi TYPE p LENGTH 2 DECIMALS 2 VALUE '3.14'.

    CLEAR iuser.

    out->write( first_name ).
    out->write( first_name ).
    out->write( pi ).

  ENDMETHOD.
ENDCLASS.
