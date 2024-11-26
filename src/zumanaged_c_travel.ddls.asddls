@AbapCatalog.sqlViewName: 'ZU_I_TRAVEL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel base CDS view'
@Metadata.ignorePropagatedAnnotations: true
define view ZUMANAGED_I_TRAVEL
  as select from /dmo/travel as Travel
  association [1] to ZUMANAGED_I_AGENCY  as _agency   on $projection.AgencyId = _agency.AgencyId
  association [2] to ZUMANAGED_I_CUST as _customer on $projection.CustomerId = _customer.CustomerId
  association [3] to I_Currency            as _currency on $projection.CurrencyCode = _currency.Currency
{
  key Travel.travel_id     as TravelId,
      Travel.agency_id     as AgencyId,
      Travel.customer_id   as CustomerId,
      Travel.begin_date    as BeginDate,
      Travel.end_date      as EndDate,
      Travel.booking_fee   as BookingFee,
      Travel.total_price   as TotalPrice,
      Travel.currency_code as CurrencyCode,
      Travel.description   as Description,
      Travel.status        as Status,
      Travel.createdby     as Createdby,
      Travel.createdat     as Createdat,
      Travel.lastchangedby as Lastchangedby,
      Travel.lastchangedat as Lastchangedat,
      _agency,
      _customer,
      _currency
}
