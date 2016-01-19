class Animal
  attr_reader(:name, :gender, :admittance_date, :type, :breed, :cust_id)

  define_method(:initialize) do |attributes|
    @name =  attributes.fetch(:name)
    @gender =  attributes.fetch(:gender)
    @admittance_date =  attributes.fetch(:admittance_date)
    @type =  attributes.fetch(:type)
    @breed =  attributes.fetch(:breed)
    @cust_id =  attributes.fetch(:cust_id)
  end

    define_method(:==) do |another_animal|
      self.name().==(another_animal.name())
    end

    define_singleton_method(:all) do
      returned_animals = DB.exec("SELECT * FROM animals;")
      animals = []
      returned_animals.each() do |animal|
        name = animal.fetch("name")
        gender = animal.fetch("gender")
        admittance_date = animal.fetch("admittance_date")
        type = animal.fetch("type")
        breed = animal.fetch("breed")
        cust_id = animal.fetch("cust_id").to_i()
        animals.push(Animal.new({:name => name, :gender => gender, :admittance_date => admittance_date, :type => type, :breed => breed, :cust_id => cust_id}))
      end
      animals
    end

    define_method(:save) do
      DB.exec("INSERT INTO animals (name, gender, admittance_date, type, breed, cust_id) VALUES ('#{@name}', '#{@gender}', '#{@admittance_date}', '#{@type}', '#{@breed}', #{@cust_id.to_i});")
    end

end
