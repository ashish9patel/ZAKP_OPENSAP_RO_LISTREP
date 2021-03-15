@EndUserText.label: 'Booking BO projection view'
@AccessControl.authorizationCheck: #CHECK

@Metadata.allowExtensions: true  //allow the projection view to be enhanced with separate metadata extensions
@Search.searchable: true //enable full text search


define view entity ZC_AKP_BOOKING
  as projection on ZI_AKP_BOOKING as Booking
{
  key BookingUuid,
      TravelUuid,
      @Search.defaultSearchElement: true
      BookingId,
      BookingDate,
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Customer', element: 'CustomerID' } }]
      @ObjectModel.text.element: ['CustomerName']
      @Search.defaultSearchElement: true
      CustomerId,
      _Customer.LastName as CustomerName,
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Carrier', element: 'AirlineID'  } }]
      @ObjectModel.text.element: ['CarrierName']
      CarrierId,
      _Carrier.Name      as CarrierName,
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Flight', element: 'ConnectionID ' },
                                            additionalBinding: [{ localElement: 'CarrierId', element: 'AirlineID' },
                                                                { localElement: 'FlightDate', element: 'FlightDate' } ] }]
      //ADD additional binding and check later
      ConnectionId,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_Currency', element: 'Currency' } }]
      CurrencyCode,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LocalLastChangedAt,
      /* Associations */
      _Carrier,
      _Connection,
      _Currency,
      _Customer,
      _Flight,
      _Travel : redirected to parent ZC_AKP_TRAVEL    ////do not forget this VVImp
}

//A preset filter condition can be established by an additional binding for the value help.
// Context:
//    You use an additional binding to define more than one binding condition,
//                                              between the source view and the value help provider.
//     The value help is then automatically filtered by the additional binding.
//     It proposes only entries that match the additional binding.
//
//     This additional binding can either be another element or a parameter.
//     These need to be present in the source view and in the value help provider view.
//     When an entry is selected in the value help provider,
//      the values of both binding elements are transferred to the input fields of the source CDS view.
