@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Entity for composition with Booking'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_RM_I_M_BOOKING as select from /dmo/booking as Booking
association to parent ZI_RM_I_M_TRAVEL as _Travel
on $projection.TravelId = _Travel.TravelId
association[1..1] to ZI_Customer_U_FL as _Customer
on $projection.CustomerId = _Customer.CustomerId
association[1..1] to /DMO/I_Carrier as _Carrier
on $projection.CarrierId = _Carrier.AirlineID
association[1..1] to /DMO/I_Connection as _Connection
on $projection.ConnectionId = _Connection.ConnectionID
and $projection.CarrierId = _Connection.AirlineID
{
    key Booking.travel_id as TravelId,
    key Booking.booking_id as BookingId,
    Booking.booking_date as BookingDate,
    Booking.customer_id as CustomerId,
    Booking.carrier_id as CarrierId,
    Booking.connection_id as ConnectionId,
    Booking.flight_date as FlightDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    Booking.flight_price as FlightPrice,
    Booking.currency_code as CurrencyCode,
    @UI.hidden: true
    _Travel.Lastchangedat,
    _Carrier,
    _Connection,
    _Customer,
    _Travel
}
