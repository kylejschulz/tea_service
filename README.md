# Tea Subscription Service - Back End API

## Table of Contents

- [Getting Started](#getting-started)
- [Running the tests](#running-the-tests)
- [Endpoints](#endpoints)
- [Built With](#built-with)
- [Authors](#authors)
- 
## About this Project
This application exposes an API for serving for signing up customers with monthly tea subscriptions.

## Authors
- **Kyle Schulz**
|    [GitHub](https://github.com/kylejschulz) |
[LinkedIn](https://www.linkedin.com/in/kyle-schulz-204056209/)


### Prerequisites

To run this application you will need Ruby 2.5.3 and Rails 5.2.5

## Getting Started

To get the web application running:

1. Clone this repo
```
https://github.com/kylejschulz/tea_service
```

2. Install gem packages: `bundle install`

3. Create and Migrate DB
```
$rails db:{create,migrate}
```

4. Start your server!
```
$ rails s
```

## Running the tests

```
bundle exec rspec
```

### Endpoints
HTTP verbs  | Path                                                               | Use
----------- | ------------------------------------------------------------------ |-------------------------------------------
POST        | /api/v1/customers/:customer_id/subscriptions/:subscription_id      | Subscribe a customer to a tea subscription
PATCH/PUT   | /api/v1/customers/:customer_id/subscriptions/:subscription_id      | Cancel a customer's tea subscription
GET         | /api/v1/customers/:customer_id/subscriptions                       | See all a customer's subscriptions
GET         | /api/v1/customers/:customer_id/teas                               | See all a customer's unique teas
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

##### See All a Customer's Unique Teas
GET `http://localhost:3000/api/v1/customers/1/teas`
response:
```
{
    "data": [{
        "id": "1",
        "type": "tea",
        "attributes": {
            "id": "1",
            "title": "Earl Grey"
            "description": "very light earl greay from puerto rico"
            "temperature": "87"
            "brew_time": "2"
        },
        "id": "2",
        "type": "tea",
        "attributes": {
            "id": "2",
            "title": "Green"
            "description": "Earthy tea form southeastern china"
            "temperature": "85"
            "brew_time": "4"
        }
    }]
}
```
### Database Schema
