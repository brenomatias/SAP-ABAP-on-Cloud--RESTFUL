@AbapCatalog.sqlViewName: 'ZU_I_TRAVEL2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel base CDS view - root object'
@Metadata.ignorePropagatedAnnotations: true
define root view ZUMANAGED_C_TRAVEL_2
  as select from /dmo/travel as Travel
  association [1] to ZUMANAGED_I_AGENCY  as _agency   on $projection.AgencyId = _agency.AgencyId
  association [2] to ZUMANAGED_I_CUST as _customer on $projection.CustomerId = _customer.CustomerId
  association [3] to I_Currency            as _currency on $projection.CurrencyCode = _currency.Currency
{     @UI.facet: [{ purpose: #STANDARD, type: #IDENTIFICATION_REFERENCE,
                    label: 'Details', position: 10 
                 }]
      @UI.selectionField: [{ position: 10 }]
      @EndUserText.label: 'Travel No'
      @UI.lineItem: [{ position: 10 }]
      @UI.identification: [{ position: 100}]
  key Travel.travel_id     as TravelId,
      @UI.selectionField: [{ position: 20 }]
      @EndUserText.label: 'Agency No'
      @UI.lineItem: [{ position: 20 }]
      @UI.identification: [{ position: 10 }]
      @ObjectModel.text.association: '_agency'
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZUMANAGED_I_AGENCY', element: 'AgencyId' } }]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Travel.agency_id     as AgencyId,
      @UI.selectionField: [{ position: 10 }]
      @EndUserText.label: 'Customer No'
      @UI.lineItem: [{ position: 30 }]
      @UI.identification: [{ position: 20 }]
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZUMANAGED_I_CUST', element: 'CustomerId' } }]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Travel.customer_id   as CustomerId,
      @UI.identification: [{ position: 30 }]
      Travel.begin_date    as BeginDate,
      @UI.identification: [{ position: 40 }]
      Travel.end_date      as EndDate,
      @UI.identification: [{ position: 50 }]
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Travel.booking_fee   as BookingFee,
      @UI.lineItem: [{ position: 40 }]
      @UI.identification: [{ position: 60 }]
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Travel.total_price   as TotalPrice,
      @UI.lineItem: [{ position: 50 }]
      Travel.currency_code as CurrencyCode,
      @UI.lineItem: [{ position: 80 }]
      @UI.identification: [{ position: 50 }]
      Travel.description   as Description,
      @UI.lineItem: [{ position: 90 }, {type: #FOR_ACTION, dataAction: 'set_booked', label: 'Set Booked'}]
      @UI.identification: [{ position: 90 }]
      Travel.status        as Status,
      _agency,
      _customer,
      _currency
}
