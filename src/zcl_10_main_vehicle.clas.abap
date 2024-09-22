CLASS zcl_10_main_vehicle DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_10_main_vehicle IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA vehicle  TYPE REF TO lcl_vehicle. " Vehicle vehicle;
    DATA vehicles TYPE TABLE OF REF TO lcl_vehicle.

    " Pointer auf das Objekt -> Speicheradresse
    " Compiler weiß automaisch, dass auf lcl_vehicle referenziert wird
    " möglich wäre auch: vehicle = NEW lcl_vehicle( ).
    " # = Inferenz
    vehicle = NEW #( make  = 'Porsche'
                     model = '911' ). " vehicle = new Vehicle();
    APPEND vehicle TO vehicles.

    vehicle = NEW #( make  = 'Audi'
                     model = 'A4' ). " vehicle = new Vehicle();
    APPEND vehicle TO vehicles.

    LOOP AT vehicles INTO vehicle.
      out->write( vehicle->to_string( ) ).
*      out->write( |Hersteller: { vehicle->get_make(  ) }| ).

    ENDLOOP.

    vehicles[ 1 ]->accelerate( 50 ).
    TRY.
        vehicles[ 2 ]->brake( 150 ).
      CATCH cx_abap_invalid_value INTO FINAL(x).
        out->write( x->get_text( ) ).
    ENDTRY.
    " Geheimnisprinzip, Konstruktor kann nicht mehr aufgerufen werden
    " vehicles[ 2 ]->set_attributes( make = 'Peugeot' model = '12345' ).
    out->write( vehicles ).
  ENDMETHOD.
ENDCLASS.
