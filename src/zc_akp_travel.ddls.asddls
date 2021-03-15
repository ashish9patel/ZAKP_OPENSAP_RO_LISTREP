@EndUserText.label: 'Travel BO projection view'
@AccessControl.authorizationCheck: #CHECK

@Metadata.allowExtensions: true  //allow the projection view to be enhanced with separate metadata extensions
@Search.searchable: true //enable full text search

define root view entity ZC_AKP_TRAVEL
  as projection on ZI_AKP_TRAVEL as Travel
  //notice the key word projection as this is supposed to be a projection view
{
  key TravelUuid,
      @Search.defaultSearchElement: true
      TravelId,
      @Consumption.valueHelpDefinition: [{
          entity: {
              name: '/DMO/I_Agency',
              element: 'AgencyID'
          }
       }]
      @ObjectModel.text.element: ['AgencyName']
      @Search.defaultSearchElement: true
      AgencyId,
      _Agency.Name       as AgencyName,
      @Consumption.valueHelpDefinition: [{
          entity: {
              name: '/DMO/I_Customer',
              element: 'CustomerID'
          }
       }]
      @ObjectModel.text.element: ['CustomerName']
      @Search.defaultSearchElement: true
      CustomerId,
      _Customer.LastName as CustomerName,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      @Consumption.valueHelpDefinition: [{
          entity: {
              name: 'I_Currency',
              element: 'Currency'
          }
       }]
      CurrencyCode,
      Description,
      TravelStatus,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      LocalLastChangedAt,
      /* Associations */
      _Agency,
      _Booking: redirected to composition child ZC_AKP_BOOKING,     //do not forget this VVImp
      _Currency,
      _Customer
}


//Enable the freestyle search for the view columns TravelID, AgencyID, and CustomerID
//  using the element annotation @Search.DefaultSearchElement.

//Specify AgencyName and CustomerName as textual descriptions
// for the elements AgencyID and CustomerID respectively
// using the element annotation @ObjectModel.text.element.

//Define value helps for the view elements AgencyID, CustomerID, and CurrencyCode
// using the element annotation @Consumption.ValueHelpDefinition

