class Owner
  # code goes here
attr_reader :name, :species

@@all = []

  def initialize(name)
    @name = name
    @species = "human"

    @@all << self 
  end

  def say_species
    "I am a human."
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

    def buy_cat(name)
      new_cat = Cat.new(name, self)
      @@all << new_cat
    end 

    def buy_dog(name)
      new_dog = Dog.new(name, self)
      @@all << new_dog
    end 

    def walk_dogs
      self.dogs.each do |dog|
        dog.mood = "happy"
      end 
    end 

    def feed_cats 
      self.cats.each do |cat|
      cat.mood = "happy"
      end 
    end 

    def sell_pets
      self.cats.each do |cat| 
        cat.mood = "nervous"
        cat.owner = nil
      end 
       self.dogs.each do |dog| 
        dog.mood = "nervous"
        dog.owner = nil 
       end 
    end 

    def list_pets
      "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
    end 

end


   

