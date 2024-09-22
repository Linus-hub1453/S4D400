*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS LCL_TESTER DEFINITION.
  PUBLIC SECTION.
    METHODS sinus_ausgabe IMPORTING VALUE TYPE i RETURNING VALUE(ausgabe) TYPE string.

ENDCLASS.

CLASS LCL_TESTER IMPLEMENTATION.
  METHOD sinus_ausgabe.
    TYPES ty_result type i.
    CONSTANTS pi TYPE p DECIMALS 14 VALUE '3.14159265358979'.
    DATA result type ty_result.
    DATA output type string.

    result = sin( '0.5' * pi ).

    DO VALUE TIMES.
*     out->write( sy-index ).

      DO sin( sy-index * '0.1' ) * 50 + 50 TIMES.
        output = |{ output }-|.
      ENDDO.
      output = |{ output }\n|.
    ENDDO.

    RETURN output.
  ENDMETHOD.
ENDCLASS.
