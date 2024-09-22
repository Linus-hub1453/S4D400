CLASS zcl_10_compute DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_10_compute IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*  DATA(number1) = -8.
*  DATA(number2) = 3.
*  DATA result TYPE p decimals 2.
*  result = number1 / number2.
*  DATA(output) = |{ number1 } / { number2 } = { result }|. "String Template
*  out->write( output ).

    DATA number1 TYPE i.
    DATA number2 TYPE i.
    DATA op TYPE c LENGTH 1.
    DATA result TYPE p length 8 decimals 2.
    DATA output TYPE string.
    number1 = 123.
    number2 = 0.
    op = '/'.

    CASE op.
      WHEN '+'.
        result = number1 + number2.
      WHEN '-'.
        result = number1 - number2.
      WHEN '*'.
        result = number1 * number2.
      WHEN '/'.
        TRY.
          result = number1 / number2.
        ENDTRY.
      WHEN OTHERS.
        output = |{ op } is not a valid operator.|.
    ENDCASE.

    IF output IS INITIAL.
      output = |{ number1 } { op } { number2 } = { result }|.
    ENDIF.

    out->write( output ).
  ENDMETHOD.
ENDCLASS.
