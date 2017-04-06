require 'pry'
require 'fish.rb'
require 'cat.rb'
require 'dog.rb'

class Owner
    attr_reader :species
    attr_accessor :name, :pets

    @@all = []

    def initialize(species)
        @species = species
        @name = name
        @@all << self
        @pets = {fishes: [], cats: [], dogs: []}
    end

    def say_species
        "I am a #{@species}."
    end

    def self.all
        @@all
    end

    def self.reset_all
        @@all = []
    end

    def self.count
        @@all.length
    end

    def buy_fish(name)
        name = Fish.new(name)
        self.pets[:fishes] << name
        # binding.pry
    end

    def buy_cat(name)
        name = Cat.new(name)
        self.pets[:cats] << name
    end

    def buy_dog(name)
        name = Dog.new(name)
        self.pets[:dogs] << name
    end

    def walk_dogs
        self.pets[:dogs].each do |x|
            x.mood = "happy"
        end
    end

    def play_with_cats
        self.pets[:cats].each do |cat|
            cat.mood = "happy"
        end
    end

    def feed_fish
        self.pets[:fishes].each do |fish|
            fish.mood = "happy"
        end
    end

    def sell_pets
        self.pets.each do |x|
            x[1].each do |z|
                z.mood = "nervous"
            end
        end
        @pets = {}
    end

    def list_pets
        # binding.pry
        fish = self.pets[:fishes].length
        dogs = self.pets[:dogs].length
        cats = self.pets[:cats].length

        "I have #{fish} fish, #{dogs} dog(s), and #{cats} cat(s)."
    end


end
