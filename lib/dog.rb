# Dog class belongs to Owner Class

class Dog
  attr_accessor :owner, :mood
  attr_reader :name

  @@all = []

  def self.all
    @@all
  end 

  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    @@all << self
  end 

  def add_owner(owner)
    self.owner = owner
  end 
end