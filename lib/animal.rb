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
        description = animal.fetch("name")
        animals.push(Animal.new({:name => name}))
      end
      animals
    end

    define_method(:save) do
      DB.exec("INSERT INTO animals (name, gender, admittance_date, type, breed) VALUES ('#{@name}', '#{@gender}', '#{@admittance_date}', '#{@type}', '#{@breed}');")
    end

end
