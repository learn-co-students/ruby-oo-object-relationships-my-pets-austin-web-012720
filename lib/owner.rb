class Owner
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def species
    @species
  end

  def say_species
    "I am a #{@species}."
  end

  def self.count
    count = @@all.length
  end

  def self.reset_all
    clear_array = @@all.clear
  end

  def cats
    owner_cats = []
    owner_cats = Cat.all.select {|x| x.owner == self}
  end

  def dogs
    owner_dogs = []
    owner_dogs = Dog.all.select {|x| x.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each {|x| x.mood = "happy"}
  end

  def feed_cats
    self.cats.each {|x| x.mood = "happy"}
  end

  def sell_pets
    @pets = dogs.each + cats.each
    @pets.each {|x| x.mood = "nervous"}
    @pets.each {|x| x.owner = nil}
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

  def self.all
    @@all
  end

end
