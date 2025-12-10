@AbapCatalog.sqlViewName: 'ZIAGENCYUFL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Agency View - CDS Data Model'
@Metadata.ignorePropagatedAnnotations: true
define view ZI_Agency_U_FL as select from /dmo/agency as Agency
association[0..1] to I_Country as _Country on
$projection.CountryCode = _Country.Country
{
    key Agency.agency_id as AgencyId,
    Agency.name as Name,
    Agency.street as Street,
    Agency.postal_code as PostalCode,
    Agency.city as City,
    Agency.country_code as CountryCode,
    Agency.phone_number as PhoneNumber,
    Agency.email_address as EmailAddress,
    Agency.web_address as WebAddress,
    _Country
}
