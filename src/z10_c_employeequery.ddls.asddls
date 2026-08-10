@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee (Query)'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z10_C_EMPLOYEEQUERY
  as select from Z10_R_EMPLOYEE
{
  key EmployeeId,
      FirstName,
      LastName,
      BirthDate,
      EntryDate,
      DepartmentId,

      _DEPARTMENT.Description                                                                   as DepartmentDescription,

      //      _DEPARTMENT._Assistant.LastName          as AssistantName,         "Übung 14 -1

      concat_with_space( _DEPARTMENT._Assistant.FirstName, _DEPARTMENT._Assistant.LastName, 1 ) as AssistantName,

      // ************* Übung 13 ****************
      @EndUserText.label: 'Employee Role (Übung 13)'
      case EmployeeId
       when _DEPARTMENT.HeadId then 'H'
       when _DEPARTMENT.AssistantId then 'A'
       else ' '
       end                                                                                      as EmployeeRole,

      //Zusatzausgabe  (Kein Bestandteil einer Übung)
          @Semantics.amount.currencyCode: 'CurrencyCode'
          AnnualSalary                                                                              as AnnualSalary,
          CurrencyCode                                                                              as CurrencyCode,
      //      Zusatzausgabe Ende




      @EndUserText.label: 'Annual Salary  (Übung 14)'
      @Semantics.amount.currencyCode: 'CurrencyCodeUSD'
      currency_conversion( amount => AnnualSalary,
                          source_currency => CurrencyCode,
                          target_currency => $projection.CurrencyCodeUSD,
                           exchange_rate_date => $session.system_date)                          as AnnualSalaryConverted,

      @EndUserText.label: 'Monthly Salary (Übung 13)'
      @Semantics.amount.currencyCode: 'CurrencyCodeUSD'
      cast( AnnualSalary as abap.fltp ) / 12.0                                                  as MonthlySalary,

      //      CurrencyCode,                                                                   "Ubung 14-4
      cast( 'USD' as /dmo/currency_code )                                                       as CurrencyCodeUSD,

      // ************* End Übung 13 ****************

      // Übung 14-2 und Übung 14-3
      division(  dats_days_between( EntryDate, $session.system_date ), 365, 1 )                 as CompanyAffiliation,

      /* Associations */
      _DEPARTMENT
}
