CLASS zcl_10_05_filter DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_10_05_filter IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

** Abbildung 122

*     SELECT FROM /DMO/i_connection_r
*        FIELDS AirlineID, ConnectionID, \_Airline-Name, \_Airline-CurrencyCode
*            INTO TABLE @DATA(result).
*
*        out->write( result ).

** Abbildung 123

*           SELECT FROM /DMO/i_connection_r
*        FIELDS AirlineID, ConnectionID,
*               \_Airline-Name,
*               \_Airline\_Currency-CurrencyISOCode
*            INTO TABLE @DATA(result).
*
*        out->write( result ).

** Abbildung 123

         SELECT FROM i_currency
         FIELDS currency,
            \_Text[   Language = 'E' ]-CurrencyShortName AS CurrencyNameEN,   " Hier mit Syntaxwarnung
            \_Text[ MANY TO ONE WHERE Language = 'D' ]-CurrencyShortName AS CurrencyNameDE

         INTO TABLE @DATA(result).

        out->write( result ).

  ENDMETHOD.
ENDCLASS.
