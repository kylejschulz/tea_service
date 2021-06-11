# Tea Subscription Service
### Endpoints
HTTP verbs  | Path                                       | Use
----------- | ------------------------------------------ |-------------------------------------------
POST        | /api/v1/customer_subscription              | Subscribe a customer to a tea subscription
PATCH/PUT   | /api/v1/customer_subscription/:customer_id | Cancel a customer's tea subscription
GET         | /api/v1/customer_subscription/:customer_id | See all a customer's subscriptions
##### Subscribe a Customer to a Tea Subscription
POST `http://localhost:3000/api/v1/customer_subscription`,
body:
```
json
{
  "customer_id": "1",
  "subscription_id": "1",
}
```
response:
```
{
    "data": {
        "id": "1",
        "type": "customer_subscription",
        "attributes": {
            "id": "1",
            "customer_id": "1"
            "subscription_id": "1"
        }
    }
}
```
##### Cancel a Customer's Tea Subscription
PATCH/PUT `http://localhost:3000/api/v1/customer_subscription/:customer_id`
body:
```
json
{
  "customer_id": "1",
  "subscription_id": "1",
}
```
response:
```
{
    "data": {
        "id": "1",
        "type": "subscription",
        "attributes": {
            "id": "1",
            "title": "Earl Grey"
            "price": "5.50"
            "status": "Cancelled"
            "frequency_per_month": "2"
        }
    }
}
```
##### See All a Customer's Subscriptions
GET `http://localhost:3000/api/v1/customer_subscription/1`
response:
```
{
    "data": [{
        "id": "1",
        "type": "subscription",
        "attributes": {
            "id": "1",
            "title": "Earl Grey"
            "price": "5.50"
            "status": "Cancelled"
            "frequency_per_month": "2"
        },
        "id": "2",
        "type": "subscription",
        "attributes": {
            "id": "2",
            "title": "Green"
            "price": "6.50"
            "status": "Active"
            "frequency_per_month": "4"
        }
    }]
}
```
### Database Schema
