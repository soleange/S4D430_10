CLASS zcl_10_itab_sorted DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_10_itab_sorted IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


  DATA t_con TYPE z40t_flight.
  DATA con like line of t_con.

   out->write( 'Hier die Ausgabe in Datenbanksortierung' ).
   out->write( '---------------------------------------------------------------' ).

   SELECT *
    FROM /dmo/flight
    WHERE carrier_id = 'LH'

   into TABLE @DATA(con1).

   out->write( con1 ).
      out->write( '---------------------------------------------------------------' ).

* Endselect.

   out->write( 'Hier die Sortierung nach meiner ITAB' ).
   out->write( '---------------------------------------------------------------' ).


    SELECT *
    FROM /dmo/flight
    WHERE carrier_id = 'LH'
    into TABLE @t_con.

   out->write( t_con ).

  ENDMETHOD.
ENDCLASS.
