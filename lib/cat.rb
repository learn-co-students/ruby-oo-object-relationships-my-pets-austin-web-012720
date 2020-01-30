class Cat
  attr_accessor :owner, :mood
  attr_reader :name

  @@all = []

  def initialize(name, owner=Owner.new, mood="nervous")
    @name = name
    @owner = owner
    @mood = mood

    @@all << self
  end

  # Class Methods
  def self.all
    @@all
  end
end