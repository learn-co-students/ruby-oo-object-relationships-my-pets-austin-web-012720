require 'pry'

class Owner
  
  attr_reader :name, :species
  attr_accessor :mood

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"

    @@all << self
  end

  def say_species
    "I am a #{species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all = []
  end

  def cats
    Cat.all.select { |c| c.owner == self }
  end

  def dogs
    Dog.all.select { |d| d.owner == self }
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs    
    self.dogs.each { |d| d.mood = "happy"}
  end

  def feed_cats
    self.cats.each { |c| c.mood = "happy" }
  end

  def sell_pets
    all_pets = self.cats + self.dogs
    all_pets.each do |x|
      x.mood = "nervous"
      x.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end