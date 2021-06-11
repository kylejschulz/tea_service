# Tea Subscription Service
### Endpoints
HTTP verbs  | Path                                                               | Use
----------- | ------------------------------------------------------------------ |-------------------------------------------
POST        | /api/v1/customers/:customer_id/subscriptions/:subscription_id      | Subscribe a customer to a tea subscription
PATCH/PUT   | /api/v1/customers/:customer_id/subscriptions/:subscription_id      | Cancel a customer's tea subscription
GET         | /api/v1/customers/:customer_id/subscriptions                       | See all a customer's subscriptions
##### Subscribe a Customer to a Tea Subscription
POST `http://localhost:3000/api/v1/customers/:customer_id/subscriptions/:subscription_id`,

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
PATCH/PUT `http://localhost:3000/api/v1/customers/:customer_id/subscriptions/:subscription_id`

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
            "frequency": "2"
        }
    }
}
```
##### See All a Customer's Subscriptions
GET `http://localhost:3000/api/v1/customers/1/subscriptions`
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
            "frequency": "2"
        },
        "id": "2",
        "type": "subscription",
        "attributes": {
            "id": "2",
            "title": "Green"
            "price": "6.50"
            "status": "Active"
            "frequency": "4"
        }
    }]
}
```
### Database Schema
