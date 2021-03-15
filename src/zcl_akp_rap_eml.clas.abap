CLASS zcl_akp_rap_eml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_akp_rap_eml IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    "Run this class console application and see the output in the console view(F9)

*    "Step 1 - READ
*    READ ENTITIES OF zi_akp_travel
*     ENTITY Travel
*     FROM VALUE #( ( TravelUuid = '04E103E04499CE7B170003025FDD779E' ) )
*     RESULT DATA(lt_travels).
*
*    out->write( lt_travels ).


*    "Step 2 - READ with fields
*    READ ENTITIES OF zi_akp_travel
*     ENTITY Travel
*     FIELDS ( TravelId AgencyId CustomerId  )
*     WITH VALUE #( ( TravelUuid = '04E103E04499CE7B170003025FDD779E' ) )
*     RESULT DATA(lt_travels).
*
*    out->write( lt_travels ).


*    "Step 3 - READ with All fields
*    READ ENTITIES OF zi_akp_travel
*     ENTITY Travel
*     ALL FIELDS WITH VALUE #( ( TravelUuid = '04E103E04499CE7B170003025FDD779E' ) )
*     RESULT DATA(lt_travels).
*
*    out->write( lt_travels ).


*    "Step 4 - READ by Association
*    READ ENTITIES OF zi_akp_travel
*     ENTITY Travel BY \_Booking
*     ALL FIELDS WITH VALUE #( ( TravelUuid = '04E103E04499CE7B170003025FDD779E' ) )
*     RESULT DATA(lt_bookings).
*    out->write( |Read by association| ).
*    out->write( lt_bookings ).


*    "Step 5 - Unsuccessful READ
*    READ ENTITIES OF zi_akp_travel
*     ENTITY Travel
*     ALL FIELDS WITH VALUE #( ( TravelUuid =  '99999999999999999999999999999999' ) )
*     RESULT DATA(lt_travels)
*     FAILED DATA(lt_failed)
*     REPORTED DATA(lt_reported).
*
*    out->write( lt_travels ).
*    out->write( lt_failed ).   "complex data type not supported by the console output
*    out->write( lt_reported ). "complex data type not supported by the console output



*    "Step 6 - MODIFY UPDATE
*    MODIFY ENTITIES OF zi_akp_travel
*     ENTITY Travel
*        UPDATE
*            SET FIELDS WITH VALUE
*                    #( ( TravelUuid = '04E103E04499CE7B170003025FDD779E' description = 'Modify Update using EML'   ) )
*        FAILED DATA(lt_failed)
*        REPORTED DATA(lt_reported).
*
*    "Step 6b - Commit Entities
*    COMMIT ENTITIES
*        RESPONSE OF zi_akp_travel
*        FAILED DATA(lt_failed_commit)
*        REPORTED DATA(lt_reported_commit).
*
*    out->write( |Update done|  ).


*    "Step 7 - MODIFY CREATE
*    "(Create a new travel record)
*    MODIFY ENTITIES OF zi_akp_travel
*    ENTITY Travel
*        CREATE
*            SET FIELDS WITH VALUE
*                #( (
*                    %cid = 'MyContentID_1'
*                    AgencyId = '70012'
*                    CustomerID = '14'
*                    BeginDate = cl_abap_context_info=>get_system_date( )
*                    EndDate = cl_abap_context_info=>get_system_date( ) + 10
*                    Description = 'Created via EML MODIFY CREATE Statement'
*                  )  )
*
*        MAPPED DATA(lt_mapped)
*        FAILED DATA(lt_failed)
*        REPORTED DATA(lt_reported).
*
*    out->write( lt_mapped-travel ).
*
*    COMMIT ENTITIES
*        RESPONSE OF zi_akp_travel
*        FAILED DATA(lt_failed_commit)
*        REPORTED DATA(lt_reported_commit).
*
*    out->write( |Create done|  ).


    "Step 8 - MODIFY DELETE
    MODIFY ENTITIES OF zi_akp_travel
    ENTITY Travel
    DELETE FROM
        VALUE
            #( ( TravelUuid = '026C0074B9081EDB9FD44D5B3E296DA8' ) )
        FAILED DATA(lt_failed)
        REPORTED DATA(lt_reported).

    COMMIT ENTITIES
        RESPONSE OF zi_akp_travel
        FAILED DATA(lt_failed_commit)
        REPORTED DATA(lt_reported_commit).

    out->write( |Delete done|  ).




























  ENDMETHOD.

ENDCLASS.
