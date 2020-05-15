class Owner
  attr_reader :name, :species
  @@all = []
  def initialize(name,species = "human")
    @name = name
    @species = species
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
    "I am a human."
  end

  #cats
  #returnsa a collection of all the cats that belong to the owner

  def cats
    Cat.all.select{|cat| cat.owner == self}
  end
  #dogs
  #returnsa a collection of all the dogs that belong to the owner
  def dogs
    Dog.all.select{|dog| dog.owner == self}
  end
  def buy_cat(name)
    #Make a new instance of the appropriate pet, 
    #initializing it with that name and the owner who is purchasing it.
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name,self)
  end

  #walks the dogs which makes the dogs' moods happy
  def walk_dogs
    self.dogs.map{|dog| dog.mood = "happy"}
  end 
  
  #feeds cats which makes the cats' moods happy
  def feed_cats
    self.cats.map{|cat| cat.mood = "happy"}
  end
  
  #can sell all its pets, which makes them nervous
  #and leaves them without an owner
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
  
  #can list off its pets 
  def list_pets
    "I have #{dogs.size} dog(s), and #{cats.size} cat(s)."
  end
    
end