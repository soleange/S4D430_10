CLASS zcl_10_struct_04 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_10_struct_04 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


   TYPES: BEGIN OF st_person_nested,

          Vorname TYPE /dmo/first_name,
          Nachname Type /dmo/last_name.

          INCLUDE TYPE z40_address AS Adresse.

    TYPES END OF st_person_nested.

    DATA Person TYPE st_person_nested.

    DATA person_2 TYPE z40_person.

    person-vorname = 'Stefdan'.
    person-nachname = 'Breidenbach'.
    person-adresse-country_code = 'DE'.
    person-ort = 'Göttingen'.
    person-postal_code = 37170.
    person-street = 'Schlossalle'.
    person-status = 'x'.

    out->write( person ).

  ENDMETHOD.
ENDCLASS.
