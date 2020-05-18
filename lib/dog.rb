class Dog
  # code goes here
  attr_reader :name
  attr_accessor :owner, :mood

  @@all_dogs = []


  def initialize dog_name, owner_obj
    @name = dog_name
    @owner = owner_obj
    @mood = "nervous"

    self.class.all << self
  end

  def self.all
    @@all_dogs
  end


end
