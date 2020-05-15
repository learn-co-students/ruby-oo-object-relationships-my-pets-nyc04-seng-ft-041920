class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(name, species="human")
    @name = name
    @species = species
    save
  end

  def save
    @@all << self
  end

  def say_species
    return "I am a #{self.species}."
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
    Cat.all.select do |kitty|
      kitty.owner == self
    end
  end

  def dogs
    Dog.all.select do |puppy|
      puppy.owner == self
    end
  end

  def buy_cat(cat)
    Cat.new(cat, self)
    # bc it takes both a name and an owner, mood by default set to nervous
  end

  def buy_dog(dog)
    Dog.new(dog, self)
  end

  def walk_dogs # no arg here
    Dog.all.collect do |puppy|
      puppy.mood = "happy"
    end
  end

  def feed_cats
    Cat.all.collect do |kitty|
      kitty.mood = "happy"
    end
  end

  def sell_pets
    # can you join these two together?
    Dog.all.collect do |puppy|
      puppy.mood = "nervous" # I DON'T LIKE THIS LAB
      puppy.owner = nil
    end

    Cat.all.collect do |kitty|
      kitty.mood = "nervous"
      kitty.owner = nil
      # death_rune_count += 200
    end
  end

  def list_pets
    # call on both dogs and cats method here
    return "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

end
