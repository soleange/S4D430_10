CLASS zcl_10_itab_02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_10_itab_02 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


   TYPES: BEGIN OF st_person_nested,

          Vorname TYPE /dmo/first_name,
          Nachname Type /dmo/last_name,

          Adressen TYPE z40t_addresses,

          END OF st_person_nested.

    DATA Person TYPE st_person_nested.

    DATA person_2 TYPE z40_person.



    out->write( person ).

  ENDMETHOD.
ENDCLASS.
