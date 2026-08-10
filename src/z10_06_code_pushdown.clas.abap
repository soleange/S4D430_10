CLASS z10_06_code_pushdown DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z10_06_code_pushdown IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*  SELECT
*    FROM /dmo/flight
*    FIELDS carrier_id, connection_id, flight_date,
*
*      seats_max - seats_occupied as setats_free
*
*      INTO TABLE @DATA(result).
*
*      out->write( result ).


    SELECT FROM z40_sql_kapsel
          FIELDS CarrierId, ConnectionId, FlightDate, seats_free

                INTO TABLE @DATA(result).

      out->write( result ).

  ENDMETHOD.
ENDCLASS.
