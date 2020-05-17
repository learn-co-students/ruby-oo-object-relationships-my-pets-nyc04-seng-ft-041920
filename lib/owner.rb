require "pry"
require_relative "cat.rb"
require_relative "dog.rb"

class Owner
  attr_reader :name, :species
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.size
  end

  def self.reset_all
    @@all.clear
  end

  def say_species
    "I am a #{@species}."
  end

  def cats
    Cat.all.select do |cats|
      # binding.pry
      cats.owner == self
    end
  end

  def dogs
    Dog.all.select do |dogs|
      dogs.owner == self
    end
  end

  def buy_cat(name)
    cool_cat = Cat.new(name, self)
    cool_cat
  end

  def buy_dog(name)
    cool_pup = Dog.new(name, self)
    cool_pup
  end

  def walk_dogs
    self.dogs.map { |dog| dog.mood = "happy" }
  end

  def feed_cats
    self.cats.map { |cat| cat.mood = "happy" }
  end

  def sell_pets
    self.dogs.map { |dog| dog.mood = "nervous" }
    self.cats.map { |cat| cat.mood = "nervous" }
    self.dogs.map { |dog| dog.owner = nil }
    self.cats.map { |cat| cat.owner = nil }
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end
