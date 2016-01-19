require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/customer")
require("./lib/animal")
require("pg")
require("pry")

DB = PG.connect({:dbname => "shelter"})

get("/") do
  erb(:index)
end

get("/animals/new") do
  erb(:animal_form)
end

get("/customers/new") do
  erb(:customers_form)
end

post("/animals") do
  name = params.fetch("name")
  gender = params.fetch("gender")
  admittance_date = params.fetch("admittance_date")
  type = params.fetch("type")
  breed = params.fetch("breed")
  animal = Animal.new({:name => name, :gender => gender, :admittance_date => admittance_date, :type => type, :breed => breed, :cust_id => nil})
  animal.save()
  erb(:index)
end

post("/customers") do
  name = params.fetch("name")
  phone = params.fetch("phone")
  type_preference = params.fetch("type_preference")
  breed_preference = params.fetch("breed_preference")
  id = params.fetch("id")
  customer = Customer.new({:name => name, :phone => phone, :type_preference => type_preference, :breed_preference => breed_preference, :id => nil})
  customer.save()
  erb(:index)
end

get('/animals') do
  @animals = Animal.all()
  erb(:animals)
end

get('/customers') do
  @customers = Customer.all()
  erb(:customers)
end
