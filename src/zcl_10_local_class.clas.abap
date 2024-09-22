CLASS zcl_10_local_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_10_local_class IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA connection  TYPE REF TO lcl_connection.
    DATA connections TYPE TABLE OF REF TO lcl_connection.

    TRY.
        connection = NEW lcl_connection( i_carrier_id = 'LH' i_connection_id = '0401' ).
        APPEND connection TO connections.

        "connection_counter read-only (static attribute)
        "Zugriff vom objekt
        "out->write( connection->connection_counter ).
        "Zugriff auf statisches Attribut über = Operator von der Klasse aus
        out->write( lcl_connection=>connection_counter ).

      CATCH cx_abap_invalid_value INTO DATA(x).
        out->write( x->get_text( ) ).
        out->write( 'Method call failed' ).
    ENDTRY.

    TRY.
        connection = NEW lcl_connection( i_carrier_id = 'SQ' i_connection_id = '0001' ).
        APPEND connection TO connections.

        "connection_counter read-only (static attribute)
        "Zugriff vom objekt
        "out->write( connection->connection_counter ).
        "Zugriff auf statisches Attribut über = Operator von der Klasse aus
        out->write( lcl_connection=>connection_counter ).

      CATCH cx_abap_invalid_value INTO x.
        out->write( x->get_text( ) ).
        out->write( 'Method call failed' ).
    ENDTRY.



    LOOP AT connections INTO connection.
      out->write( connection->get_output( ) ).
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
