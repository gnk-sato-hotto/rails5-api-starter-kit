
customers = [ 
  {
    name: "customer1",
  },
  {
    name: "customer2",
  },
  {
    name: "customer3",
  },
  {
    name: "customer4",
  },
  {
    name: "customer5",
  },
  {
    name: "customer6",
  },
]

customers.each do |customer|
  Customer.seed do |s|
    s.name = customer[:name]
  end 
end

