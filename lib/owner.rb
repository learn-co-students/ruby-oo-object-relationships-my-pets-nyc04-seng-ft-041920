require_relative "cat.rb"
require_relative "dog.rb"

class Owner
  attr_reader :name, :species
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  def cats
    Cat.all.find_all{|cat| cat.owner == self }
  end

  def dogs
    Dog.all.find_all{|dog| dog.owner == self}
  end

  def buy_cat(name)
    newcat = Cat.new(name, self)
    @@all << newcat
  end

  def buy_dog(name)
    newdog = Dog.new(name, self)
    @@all << newdog
  end

  def walk_dogs
    self.dogs.each{|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each{|cat| cat.mood = "happy"}
  end

  def sell_pets
    self.cats.each{|cat| cat.mood = "nervous"}
    self.cats.each{|cat| cat.owner = nil}
    self.dogs.each{|dog| dog.mood = "nervous"}
    self.dogs.each{|dog| dog.owner = nil}
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end

#Owners
# jon = Owner.new("Jon")
# p jon.buy_cat("Sam")
# meg = Owner.new("Meg Thee Stallion")

#Dogs
# ollie = Dog.new("Ollie", jon)
# p jon.walk_dogs
# four = Dog.new("4oe", meg)

#Cat
# garfield = Cat.new("Garfield", jon)
# garfield2 = Cat.new("Garfield2", jon)

# pp jon.cats
