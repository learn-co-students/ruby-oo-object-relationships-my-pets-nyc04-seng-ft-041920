class Dog
  # code goes here
  attr_reader :name
  attr_accessor :owner, :mood
  @@all = []

  def initialize(name, owner, mood = "nervous")
    @name = name
    @owner = owner
    @mood = mood
    
    @@all << self
  end

  def self.all
    @@all
  end
end

=begin
1. Initializes with name, owner, and mood = "nevous" 
  * name cannot be changed        :: attr_reader
  * owner can be changed          :: attr_accessor
  * mood can be changed           :: attr_accessor
    
    attr_reader :name
    attr_accessor :owner, :mood
    @@all = []

    def initialize(owner, name, mood = "nervous")
      @owner = owner
      @name = name
      @mood = mood
      
      @@all << self
    end

  2. write a method of self.all to display all cats
    def self.all
      @@all
    end

=end