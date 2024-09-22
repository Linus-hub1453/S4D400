CLASS zcl_10_demo05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_10_demo05 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    WHILE sy-index < 11.
      out->write( sy-index ).
    ENDWHILE.

    DO 10 TIMES.
      out->write( sy-index ).
    ENDDO.

    DO.
      out->write( sy-index ).
      IF sy-index = 10.
        EXIT.
      ENDIF.
    ENDDO.

  ENDMETHOD.
ENDCLASS.
