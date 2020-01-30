class Owner
  attr_reader :name, :species

  @@all = []
  
  def initialize(name)
    @name = name
    @species = "human"

    @@all << self
  end

  # Class Methods
  def self.all
    @@all
  end

  def self.count
    all.size
  end

  def self.reset_all
    @@all = []
  end
  
  # Instance Methods
  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def cats
    Cat.all.select{|x| x.owner == self}
  end

  def dogs
    Dog.all.select{|x| x.owner == self}
  end

  def feed_cats
    self.cats.each{|x| x.mood = "happy"}
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

  def say_species
    "I am a #{self.species}."
  end

  def sell_pets
    self.dogs.each do |x| 
      x.mood = "nervous"
      x.owner = nil
    end

    self.cats.each do |x| 
      x.mood = "nervous"
      x.owner = nil
    end
  end

  def walk_dogs
    self.dogs.each{|x| x.mood = "happy"}
  end

end