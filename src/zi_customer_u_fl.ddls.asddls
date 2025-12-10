@AbapCatalog.sqlViewName: 'ZCUSTOMERUFLAA'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer view - CDS Data model'
@Metadata.ignorePropagatedAnnotations: true
define view ZI_Customer_U_FL as select from /dmo/customer as Customer
association[0..1] to I_Country as _Country on
$projection.CountryCode = _Country.Country
{
   key Customer.customer_id as CustomerId,
   Customer.first_name as FirstName,
   Customer.last_name as LastName,
   Customer.title as Title,
   Customer.street as Street,
   Customer.postal_code as PostalCode,
   Customer.city as City,
   Customer.country_code as CountryCode,
   Customer.email_address as EmailAddress,
   Customer.phone_number as PhoneNumber,
   _Country
}
