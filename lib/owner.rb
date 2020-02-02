#
# ************** FLATIRON SOL'N ***************
#

class Owner
  # code goes here
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  def cats
    Cat.all.select{|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select{|dog| dog.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each { |dog| dog.mood = "happy" }
  end

  def feed_cats
    self.cats.each { |cat| cat.mood = "happy" }
  end

  def sell_pets
    pets = self.dogs + self.cats

    pets.each do |pet|
      pet.mood = "nervous"
      pet.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end



#
# ************** MY SOL'N ***************
#
# class Owner
#   # code goes here
#   attr_reader :name, :species
#
#   @@all = []
#
#   def initialize(name, species = "human")
#     @name = name
#     @species = species
#
#     @@all << self
#   end
#
#   def self.all
#     @@all
#   end
#
#   def self.count
#     @@all.count
#   end
#
#   def self.reset_all
#     @@all.clear
#   end
#
#   def say_species
#     p "I am a #{self.species}."
#   end
#
#   def cats
#     Cat.all.select { |cat| cat.owner == self }
#   end
#
#   def dogs
#     Dog.all.select { |dog| dog.owner == self }
#   end
#
#   def buy_cat (name)
#     Cat.new(name, self)
#   end
#
#   def buy_dog(name)
#     Dog.new(name, self)
#   end
#
#   def change_all_dogs_moods(mood)
#     Dog.all.each do |dog|
#       if dog.owner == self
#         dog.mood = mood
#       end
#     end
#   end
#
#   def change_all_cats_moods(mood)
#     Cat.all.each do |cat|
#       if cat.owner == self
#         cat.mood = mood
#       end
#     end
#   end
#
#   def change_all_dogs_owner(owner)
#     Dog.all.each do |dog|
#       if dog.owner == self
#         dog.owner = owner
#       end
#     end
#   end
#
#   def change_all_cats_owner(owner)
#     Cat.all.each do |cat|
#       if cat.owner == self
#         cat.owner = owner
#       end
#     end
#   end
#
#   def walk_dogs
#     self.change_all_dogs_moods("happy")
#   end
#
#   def feed_cats
#     self.change_all_cats_moods("happy")
#   end
#
#   def sell_pets
#     self.change_all_cats_moods("nervous")
#     self.change_all_cats_owner(nil)
#     self.change_all_dogs_moods("nervous")
#     self.change_all_dogs_owner(nil)
#   end
#
#   def list_pets
#     p "I have #{Dog.all.count { |dog| dog.owner == self }} dog(s), and #{Cat.all.count { |cat| cat.owner == self }} cat(s)."
#   end
#
# end
