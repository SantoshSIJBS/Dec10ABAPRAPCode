@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Processor View'

@UI.headerInfo:{
    typeName: 'Travel',
    typeNamePlural: 'Travels',
    title: {value: 'TravelId'},
    description: {value: 'Description'}
}

@Search.searchable: true
define root view entity ZI_RM_I_M_TRAVEL_PROCESSOR as projection on ZI_RM_I_M_TRAVEL
{
    @Search.defaultSearchElement: true
    
    @UI.facet: [{
        id: 'Details',
        purpose: #STANDARD,
        type: #IDENTIFICATION_REFERENCE,
        label: 'Travel Details',
        position: 10
    },{
        id: 'Booking',
        purpose: #STANDARD,
        type: #LINEITEM_REFERENCE,
        label: 'Booking Details',
        position: 20,
        targetElement: '_Bookings'
    }]
   
    @UI : {
        selectionField: [{position: 10}],
        lineItem: [{position: 10}],
        identification: [{position: 10}]
    }
    
    @ObjectModel.text.element: ['Description']
    key TravelId,
    @Search.defaultSearchElement: true
    
    @UI : {
        selectionField: [{position: 20}],
        lineItem: [{position: 20}],
        identification: [{position: 20}]
    }
    @ObjectModel.text.element: ['AgencyName']
    @Consumption.valueHelpDefinition: [{entity: {name: 'ZI_AGENCY_U_FL', element: 'AgencyId'}}]
    AgencyId,
    @Search.defaultSearchElement: true
    
    @UI : {
        selectionField: [{position: 30}],
        lineItem: [{position: 30}],
        identification: [{position: 30}]
    }
    @ObjectModel.text.element: ['CustomerName']
    @Consumption.valueHelpDefinition: [{entity: {name: 'ZI_CUSTOMER_U_FL', element: 'CustomerId'}}]
    CustomerId,
    _Agency.Name as AgencyName,
    _Customer.LastName as CustomerName,
    @UI : {
        selectionField: [{position: 40}],
        lineItem: [{position: 40}],
        identification: [{position: 40}]
    }
    BeginDate,
    @UI : {
        identification: [{position: 50}]
    }
    EndDate,
    @UI : {
        identification: [{position: 60}]
    }
    @Semantics.amount.currencyCode: 'CurrencyCode'
    BookingFee,
    @UI : {
        identification: [{position: 70}]
    }
    @Semantics.amount.currencyCode: 'CurrencyCode'
    TotalPrice,
    @UI : {
        identification: [{position: 80}]
    }
    CurrencyCode,
    @UI : {
        identification: [{position: 90}]
    }
    Description,
    @UI : {
        identification: [{position: 100, label: 'Status[O-Open | A-Accepted | X-Cancelled | B-Blocked]'}],
        lineItem: [ { position: 50, importance: #HIGH },
                    { type: #FOR_ACTION, dataAction: 'createTravelByTemplate', label: 'Copy Travel' },
                    { type: #FOR_ACTION, dataAction: 'acceptTravel', label: 'Accept'},
                    { type: #FOR_ACTION, dataAction: 'rejectTravel', label: 'Reject'}]
    }
    Status,
    @UI : {
        identification: [{position: 110}]
    }
    Createdby,
    @UI : {
        identification: [{position: 120}]
    }
    Createdat,
    Lastchangedby,
    Lastchangedat,
    /* Associations */
    _Agency,
    _Bookings: redirected to composition child ZI_RM_I_M_BOOKING_PROCESSOR,
    _Currency,
    _Customer
}
