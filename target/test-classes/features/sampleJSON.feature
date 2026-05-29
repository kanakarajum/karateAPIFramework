Feature: Trying JSON declarations

  Scenario: Declare a JSON object and access it and print the values
    * def jsonObject =
      """[
      	{
      		id: 1,
      		name: 'Tom',
      		age: 36
      	},
      		{
      		id: 2,
      		name: 'Peter',
      		age: 30
      }
      ]
      """
    * print jsonObject
    * print jsonObject[0].name
    * print jsonObject[1].name + " and his age is " + jsonObject[1].age

  Scenario: Complex json object
    * def complexJsonObject =
      """
      {
      "orderId": "ORD-2026-99X7A",
      "status": "PROCESSING",
      "meta": {
      "version": "v2.4",
      "environment": "production",
      "traceId": "6f89b91c-7b02-4dca-8a1a-4f51e9b25f44",
      "internalNotes": null
      },
      "customer": {
      "id": "CUST-8831",
      "profile": {
       "firstName": "Alex",
       "lastName": "Morgan",
       "email": "alex.morgan@example.com"
      },
      "preferences": {
       "marketingOptIn": true,
       "preferredLanguage": "en-US"
      }
      },
      "financials": {
      "currency": "USD",
      "amounts": {
       "subtotal": 149.97,
       "shipping": 15.00,
       "tax": 11.25,
       "discount": -20.00,
       "total": 156.22
      },
      "paymentDetails": [
       {
         "method": "CREDIT_CARD",
         "provider": "Visa",
         "lastFour": "4321",
         "amountAuthorized": 100.00,
         "status": "CAPTURED"
       },
       {
         "method": "GIFT_CARD",
         "provider": "StoreRewards",
         "cardCode": "GC-992-XXXX",
         "amountAuthorized": 56.22,
         "status": "CAPTURED"
       }
      ]
      },
      "shippingAddress": {
      "street": "123 Tech Ventures Blvd",
      "suite": "Suite 404",
      "city": "Austin",
      "state": "TX",
      "postalCode": "78701",
      "coordinates": {
       "latitude": 30.2672,
       "longitude": -97.7431
      }
      },
      "lineItems": [
      {
       "itemId": "PROD-101",
       "name": "Wireless Ergonomic Mouse",
       "category": "Electronics",
       "pricing": {
         "unitPrice": 49.99,
         "taxable": true
       },
       "quantity": 1,
       "tags": ["office", "hardware", "wireless"],
       "fulfillment": {
         "status": "SHIPPED",
         "carrier": "FedEx",
         "trackingNumber": "123456789012"
       }
      },
      {
       "itemId": "PROD-205",
       "name": "Mechanical Keyboard (Blue Switches)",
       "category": "Electronics",
       "pricing": {
         "unitPrice": 89.99,
         "taxable": true
       },
       "quantity": 1,
       "tags": ["office", "hardware", "mechanical"],
       "fulfillment": {
         "status": "BACKORDERED",
         "carrier": null,
         "trackingNumber": null
       }
      },
      {
       "itemId": "PROD-772",
       "name": "Premium Gel Wrist Rest",
       "category": "Office Supplies",
       "pricing": {
         "unitPrice": 9.99,
         "taxable": false
       },
       "quantity": 1,
       "tags": ["comfort", "ergonomic"],
       "fulfillment": {
         "status": "PENDING",
         "carrier": "USPS",
         "trackingNumber": "9400100000000000000000"
       }
      }
      ]
      }
      """
    * print complexJsonObject
    * print complexJsonObject.financials.paymentDetails[0].lastFour +" :: "+ complexJsonObject.financials.paymentDetails[0].status
