CLASS z10_10_arithm_ausdruecke DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z10_10_arithm_ausdruecke IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  SELECT
    FROM /dmo/flight
    FIELDS carrier_id, connection_id, flight_date,

      seats_max - seats_occupied as seats_free,

      ( cast( seats_occupied AS fltp )
          * CAST( 100 AS fltp )
      ) / CAST( seats_max AS fltp ) AS percentage_fltp

      INTO TABLE @DATA(result).

      out->write( result ).




  ENDMETHOD.
ENDCLASS.
