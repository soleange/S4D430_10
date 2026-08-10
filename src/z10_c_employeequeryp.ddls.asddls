 @AbapCatalog: {
 dataMaintenance: #RESTRICTED,
 viewEnhancementCategory: [#PROJECTION_LIST],
 extensibility.dataSources: [ 'Employee' ],
 extensibility.elementSuffix: 'ZEM'
}

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee (Query)'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z10_C_EmployeeQueryP
  with parameters

    p_target_curr : /dmo/currency_code,

    @EndUserText.label: 'Date of evalution'
    @Environment.systemField: #SYSTEM_DATE

    p_date        : abap.dats



  as select from z40_R_employee as Employee

{
  key EmployeeId,
      $parameters.p_date                                                                                 as Dates,
      FirstName,
      LastName,
      BirthDate,
      EntryDate,
      DepartmentId,

      _Department.Description                                                                            as DepartmentDescription,
      _Department._Assistent.LastName                                                                    as AssisttantName,

      //      _Department._Assistant.LastName as AssistantName,

      concat_with_space( _Department._Assistent.FirstName,
                     _Department._Assistent.LastName, 1 )                                                as AssistantName,


      @EndUserText.label: 'EmployeeRole  (Übung 13)'

      case EmployeeId
         when _Department.HeadId then 'H'
         when _Department.AssistantId then 'A'
         else ''
      end                                                                                                as EmployeeRole,


      //      cast( 'USD' as /dmo/currency_code )  as CurrencyCodeUSD,
      $parameters.p_target_curr                                                                          as CurrencyCode,

      @EndUserText.label: 'Anual Salary  (Übung 15)'
      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion( amount => AnnualSalary,
                           source_currency => CurrencyCode,
                           target_currency => $projection.CurrencyCode,
                           exchange_rate_date => $parameters.p_date, error_handling => 'SET_TO_NULL' )   as AnnualSalaryConverted,

      @EndUserText.label: 'Monthly Salary  (Übung 14)'
      @Semantics.amount.currencyCode: 'CurrencyCode'

      cast( (  cast( $projection.AnnualSalaryConverted as abap.fltp ) / 12.0 )  as  abap.curr( 10, 2 ) ) as MontlySalaryConverted,

      //       CurrencyCode,
      division ( dats_days_between( EntryDate, $session.system_date ), 365, 1 )                          as CompanyAffiliation,


      /* Associations */
      _Department
}
