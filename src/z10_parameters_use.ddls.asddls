@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS mit Eingabeparametern'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z10_PARAMETERS_USE
   with parameters
   
   DemoCurrency : /dmo/currency_code,
   FreeOccupied : abap.char( 1 ),
   @Environment.systemField: #SYSTEM_LANGUAGE
   Language     : spras,
   @Environment.systemField: #SYSTEM_DATE
   FirstFlightDate : /dmo/flight_date
   
    as select from /DMO/I_Flight
{
    key AirlineID,
    key ConnectionID,
    key FlightDate,
  
    MaximumSeats,
    OccupiedSeats,
    
// 1
  
   $parameters.DemoCurrency  as Targetcurrency,
   
   $parameters.FreeOccupied  as FreeOccupied_1,
   
   $parameters.Language      as Language_1,
   
   $parameters.FirstFlightDate as FirstFlightDate_1,
   
// 2

   case $parameters.FreeOccupied
       when 'X'
       then MaximumSeats - OccupiedSeats 
       end as FreeSeats,
       
// 3
   @Semantics.amount.currencyCode: 'TargetCurrency'
   currency_conversion( amount => Price, 
                     source_currency => CurrencyCode,
                     target_currency => $parameters.DemoCurrency,
                     exchange_rate_date => $session.user_date  ) as PriceConverted,
                     
// 4

   _Currency._Text[1: Language = $parameters.Language ].CurrencyName as CurrencNam                    
                     
}

// 5

    where /DMO/I_Flight.FlightDate > $parameters.FirstFlightDate  
