class Cat
  # code goes here
  attr_reader :name
  attr_accessor :owner, :mood

  @@all_cats = []

  def initialize cat_name, owner_obj
    @name = cat_name
    @owner = owner_obj
    @mood = "nervous"

    @@all_cats << self
  end

  def self.all
    @@all_cats
  end

end
