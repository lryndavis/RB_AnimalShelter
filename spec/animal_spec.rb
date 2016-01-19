require('rspec')
require('pg')
require('animal')

DB = PG.connect({:dbname => 'shelter_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM animals *;")
  end
end

describe(Animal) do
  describe("#==") do
    it("is the same animal if it has the same name") do
      animal1 = Animal.new({:name => "Sherman"})
      animal2 = Animal.new({:name => "Sherman"})
      expect(animal1).to(eq(animal2))
    end
  end
end

describe(Animal) do
  describe(".all") do
    it("starts off with no animals") do
      expect(Animal.all()).to(eq([]))
    end
  end

describe("#name") do
  it("tells you its name") do
  animal = Animal.new({:name => "Sherman", :gender => "male", :admittance_date => "01/31/2015", :type => "dog", :breed => "Goldendoodle", :cust_id => nil})
  end
end

describe("#save") do
  it("adds an animal to the array of saved animals") do
  test_animal = Animal.new({:name => "Sherman", :gender => "male", :admittance_date => "01/31/2015", :type => "dog", :breed => "Goldendoodle", :cust_id => nil})
  test_animal.save()
  expect(Animal.all()).to(eq([test_animal]))
  end
end

end
