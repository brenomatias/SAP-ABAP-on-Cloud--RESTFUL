@AbapCatalog.sqlViewName: 'ZU_I_CUSTOMER'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer base CDS view'
@Metadata.ignorePropagatedAnnotations: true
define view ZUMANAGED_I_CUST
  as select from /dmo/customer
  association [1] to I_Country as _country on $projection.CountryCode = _country.Country
{
  key /dmo/customer.customer_id   as CustomerId,
      /dmo/customer.first_name    as FirstName,
      /dmo/customer.last_name     as LastName,
      /dmo/customer.title         as Title,
      /dmo/customer.street        as Street,
      /dmo/customer.postal_code   as PostalCode,
      /dmo/customer.city          as City,
      /dmo/customer.country_code  as CountryCode,
      /dmo/customer.phone_number  as PhoneNumber,
      /dmo/customer.email_address as EmailAddress,
      _country // Make association public
}
