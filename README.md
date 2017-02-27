# rails5-api-starter-kit
Rails5 api starter kit is a project template for rails5 api mode.

# Versions
ruby 2.3.1  
Rails 5.0.0.1  

# DB 
mysql  
※ mysql configuration : config/database.yml

# API
This API behaves like the REST API.  
For example:  
  
There is a customer table, you will make the api like this.  
- Generate customer model and customers controller.
```
rails g model customer name:string deleted_at:timestamp
rails g controller customers
```

- Edit app/models/customer.rb.
```
class Customer < ApplicationRecord
    include FindDefault
    include ListParanoid # for logical / soft delete
end
```

- Edit app/controllers/customers_controller.rb.
```
class CustomersController < ApplicationController
    include Crud
end
```

- Open config/routes.rb and add this sentence.
```
  resources :customers 
```

- Start rails!
```
  rails s
```

- Open this URL.
```
  http://localhost:3000/customers
```

If you get customers data, you are succeeding to make the api.  
(GET, POST, PUT, and DELETE)

# Another Topic
This api uses the ransak and the kaminari by default.  
`ransak: https://github.com/activerecord-hackery/ransack`  
`kaminari: https://github.com/kaminari/kaminari`  

So you can send GET request like this.
```
http://localhost:3000/customers?name_cont=customer&pp=2&p=1
```

# To run

- Install gems  
`bundle install`

- Create develop-database and test-database  
`rails db:create`

- DB migrate  
`rails db:migrate`

- Generate seeds  
`rails db:seed_fu`
