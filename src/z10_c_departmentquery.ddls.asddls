@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Übung 16  Department (Query)'
@Metadata.ignorePropagatedAnnotations: true
//define view entity Z10_C_DepartmentQuery as select distinct from Z10_C_EMPLOYEEQUERY

define view entity Z10_C_DepartmentQuery
  with parameters
    p_target_curr : /dmo/currency_code,
    @EndUserText.label: 'Date of evaluation'
    @Environment.systemField: #SYSTEM_DATE
    p_date        : abap.dats

  as select distinct from Z10_C_EmployeeQueryP(
                          p_target_curr: $parameters.p_target_curr,
                          p_date: $parameters.p_date  ) as e

    right outer join      Z10_R_DEPARTMENT              as d 
    on e.DepartmentId = d.Id

{

  d.Id,
  d.Description,
  avg( e.CompanyAffiliation  as abap.dec( 11, 1 )) as AverageAffiliation,

  @Semantics.amount.currencyCode: 'CurrencyCode'
  sum( e.AnnualSalaryConverted )                   as TotalSalary,
  e.CurrencyCode


}
group by
  d.Id,
  d.Description,
  e.CurrencyCode
