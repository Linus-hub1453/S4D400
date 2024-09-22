*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

" Definitionsbereich Methoden...
" !<strong>Fahrzeug</strong>
class LCL_VEHICLE DEFINITION.
  PUBLIC SECTION.
*    Getter nicht notwendig: READ-ONLY, aber globale Klasse kann auf lokale Klasse zugreifen
    DATA make TYPE string READ-ONLY.
  "statisches Attribut
  "Wertänderung des Werts für alle Objekte
  CLASS-DATA number_of_vehicles type i.
  methods constructor
    IMPORTING
      make type string default 'Audi'
      model type string optional.

  " public void accelerate(int value) { speedInKmh += value; }

  "wird beim 1. Zugriff auf die Klasse aufgerufen, vor dem constructor
  "'Statischer Konstruktor'

  "CLASS-METHODS class_constructor
  "  CLASS-DATA test TYPE i.

  methods accelerate
    IMPORTING
      VALUE TYPE i default '50'.
   " public void brake(int value) throws InvalidValueException
   " { if (value > speedInKmh) {}}
   methods brake
    IMPORTING
      VALUE TYPE i
    RAISING
      cx_abap_invalid_value.

   " public String toString() { return make + ""}
   methods to_string
    RETURNING VALUE(dummy) type string.

   PRIVATE SECTION.
    DATA model TYPE string.
    DATA speed_in_kmh TYPE i.
ENDCLASS.

CLASS lcl_vehicle IMPLEMENTATION.
  METHOD constructor.
    me->make = make.
    me->model = model.
  ENDMETHOD.
  METHOD accelerate.
    speed_in_kmh += VALUE.
  ENDMETHOD.

  METHOD brake.
    IF value > speed_in_kmh.
      "Eine Exception auslösen und an die Oberklasse weitergebn
      raise EXCEPTION type cx_abap_invalid_value.
    ENDIF.
    " wird ausgelöst, wenn
    speed_in_kmh -= VALUE.
   ENDMETHOD.

   METHOD to_string.
    "dummy = |{ make } { model } { speed_in_kmh }kmh|.
    return |{ make } { model } { speed_in_kmh }kmh|.

   ENDMETHOD.
ENDCLASS.
