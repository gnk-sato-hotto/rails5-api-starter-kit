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
1. Generate customer model and customers controller.
```
rails g model customer name:string deleted_at:timestamp
rails g controller customers
```

1. Edit app/models/customer.rb.
```
class Customer < ApplicationRecord
    include FindDefault
    include ListParanoid # for logical / soft delete
end
```

1. Edit app/controllers/customers_controller.rb.
```
class CustomersController < ApplicationController
    include Crud
end
```

1. Open config/routes.rb and add this sentence.
```
  resources :customers 
```

1. Start rails!
```
  rails s
```

1. Open this URL.
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

1. Install gems  
`bundle install`

1. Create develop-database and test-database  
`rails db:create`

1. DB migrate  
`rails db:migrate`

1. Generate seeds  
`rails db:seed_fu`
