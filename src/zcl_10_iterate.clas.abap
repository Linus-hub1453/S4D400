CLASS zcl_10_iterate DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_10_iterate IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA output TYPE TABLE OF string.

    CONSTANTS count TYPE i VALUE 20.
    DATA numbers TYPE TABLE OF i.
    DO count TIMES.
      CASE sy-index.
        WHEN 1.
          APPEND 0 TO numbers.
        WHEN 2.
          APPEND 1 TO numbers.
        WHEN OTHERS.
          APPEND numbers[ sy-index - 2 ] + numbers[ sy-index - 1 ]
          TO numbers.
      ENDCASE.
    ENDDO.
    out->write( numbers ).


    LOOP AT numbers INTO DATA(number).


      APPEND |{ sy-tabix WIDTH = 14 ALIGN = LEFT }  { number }| to output.
    ENDLOOP.
    out->write( output ).
    RETURN.
  ENDMETHOD.
ENDCLASS.
