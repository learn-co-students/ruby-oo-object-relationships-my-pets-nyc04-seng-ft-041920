class Owner
  # code goes here

  attr_reader :name, :species

  @@all = []
  
  def initialize(name, species="human")
    @name = name
    @species = species
    @@all << self
  end

  def say_species
    return "I am a human."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select { |cat| cat.owner == self }
  end

  def dogs
    Dog.all.select { |dog| dog.owner == self }
  end

  def buy_cat(cat)
    Cat.new(cat, self)
  end

  def buy_dog(dog)
    Dog.new(dog, self)
  end

  def walk_dogs
    #calls on the dogs method we created on line 34 to get access to all of this owners dogs
    #iterates through all the dogs to change their moods
    dogs.each { |dog| dog.mood = "happy" }
  end

  def feed_cats
    cats.each { |cat| cat.mood = "happy" }
  end

  def sell_pets
    dogs.each do |dog| 
      dog.mood = "nervous" 
      dog.owner = nil
    end 
    cats.each do |cat| 
      cat.mood = "nervous"
      cat.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end