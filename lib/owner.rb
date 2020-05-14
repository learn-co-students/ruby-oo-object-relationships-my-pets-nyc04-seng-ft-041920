require 'pry'

class Owner
  # code goes here
  attr_reader :name, :species

  @@all = []

  def initialize(name, species = "human")
    @name = name
    @species = species
    @@all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats 
    Cat.all.select do |cat|
      cat.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def buy_cat(cat_name)
    if Cat.all.include?(cat_name)
      cats 
    else
      Cat.new(cat_name, self)
    end
  end  

  def buy_dog(dog_name)
    if Dog.all.include?(dog_name)
      dogs
    else
      Dog.new(dog_name, self)
    end
  end 

  def walk_dogs
    Dog.all.map do|dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    Cat.all.map do|cat|
      cat.mood = "happy"
    end
  end

  def self.sell_pets

  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

  def sell_pets
    Cat.all.map do|cat|
      cat.mood = "nervous"
      cat.owner = nil
    end

    Dog.all.map do|dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
  end
end

=begin
Has a Class Variable of: @@all = []

1. Initialize with name, species
  * Name can only have read permissions :: attr_reader 
  * Species has a default of "Human"    :: attr_accessor
  * pushes self into @@all

    attr_reader :name
    attr_accessor :species
    
    def initialize(name, species = "human")
      @name = name
      @species = species
    end

2. Make #say_species which returns a name 
    def say_species
      self.species
    end

3. Make the following class methods
  a. def self.all
  b. def self.count
  c. def self.reset_all

3a. 
    def self.all
      @@all
    end

3b. 
  def self.count
      @@all.count
  end

3c. 
  def self.reset_all
    @@all.clear
  end
    

=end

=begin
1. Search through Cats.all and check if Cats.owner is equal to self
    def cats 
      Cat.all.select do |cat|
        cat.owner == self
      end
    end

2. Search through Dog.all and check if Dog.owner is equal to self
    def dogs
      Dog.all.select do |dog|
        dog.owner == self
      end
    end

3. Create a function @buy_cat that makes a new instance of the appropriate pet, initializing it with that name and the owner who is purchasing it.
  def buy_cat(cat_name)
    if Cat.all.include?(cat_name)
      cats 
    else
      Cat.new(cat_name, self)
    end
  end  

4. Create a function @buy_dog that makes a new instance of the appropriate pet, initializing it with that name and the owner who is purchasing it.
    def buy_dog(dog_name)
      if Dog.all.include?(dog_name)
        dogs
      else
        Dog.new(dog_name, self)
      end
    end   

5. Create function #walk_dogs that sets each dog in Dog.all mood = "happy" ::dog.mood = "happy"
  def walk_dogs
    Dog.all.map do|dog|
      dog.mood = "happy"
    end
  end

6. Create function #feed_cats that sets each cat in Cat.all mood = "happy" ::cat.mood = "happy"
  def feed_cats
    Cat.all.map do|cat|
      cat.mood = "happy"
    end
  end

7. Create function #sell_pets. removes owner and sets mood = "nervous"
  def sell_pets
    Cat.all.map do|cat|
      cat.mood = "nervous"
      dog.owner = nil
    end

    Dog.all.map do|dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
  end

8. Interpolates value of self.cats and self.dogs to display string :: "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
    def list_pets
      "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
    end
=end