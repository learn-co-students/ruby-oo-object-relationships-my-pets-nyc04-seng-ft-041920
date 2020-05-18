class Owner
  # code goes here
  attr_reader :name, :species

  @@all_owners = []

  def initialize name
    @name = name
    @species = 'human'

    @@all_owners << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all_owners
  end

  def self.count
    @@all_owners.count
  end

  def self.reset_all
    # since the class variable is not a constant variable we can re assign it to an empty arr, if it was a constant then we would use the clear method.
    @@all_owners = []

    # @@all_owners.clear
  end

  def cats
    # since we have access to the Cat class variable that stores all cats that have been made then we use the select enumerable to find all the cats that belong to the instance owner thats calling this method "self". Also select returns a new array so we dont need to store it in an var
    Cat.all.select { |cat_ins| cat_ins.owner == self}
  end

  def dogs
    Dog.all.find_all { |dog_ins| dog_ins.owner == self }
  end

  def buy_cat new_cat
    # So we need to create a new instance of Cat using the new cat name. we store it in a local var(so it can be easier to see) then we call the Class var 'new' and for the first arg we put the 'new_cat'(string name) and second arg is the owner which is 'self'. the one who is calling this instance method.
    cat_instance = Cat.new(new_cat, self)
    cat_instance
  end

  def buy_dog new_dog
    Dog.new(new_dog, self)
  end

  def walk_dogs
    # here we use the instance method 'dogs' that we did early, since it returns all the dogs this owner owns then we use it, we use the each enumerable to iterate through the array and change each dogs mood.
    # here i use self.dogs which is explicitly calling the dogs method but i can also put 'dogs' and that is implicitly.
    self.dogs.each { |dog_ins| dog_ins.mood = "happy" }
  end

  def feed_cats
    # Implicitly calling the 'cats' instance method
    cats.each { |cat_ins| cat_ins.mood = "happy" }
  end

  def sell_pets
    all_pets = self.dogs.concat cats
    all_pets.each do |pet_ins|
      pet_ins.mood = "nervous"
      pet_ins.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end
