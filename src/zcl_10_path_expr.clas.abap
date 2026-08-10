CLASS zcl_10_path_expr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_10_path_expr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT
     FROM Z10_C_EmployeeQuery
     FIELDS employeeid,
     firstname,
     lastname,
     departmentid,
     departmentdescription,
     assistantname,
     \_department\_head-lastname AS headname ORDER BY EmployeeId
     INTO TABLE @DATA(result).



    out->write( result ).

  ENDMETHOD.
ENDCLASS.
