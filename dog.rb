require 'mysql2'
require 'debugger'

class Dog

  attr_accessor :name, :color, :id
  
  @@db = Mysql2::Client.new(:host => "localhost", :username => "root", :database => "dogs")

  def initialize(name, color)
    @name = name
    @color = color
  end

  def self.db
    @@db
  end

  def db
    @@db
  end

  def self.find_by_id(id)
    results = self.db.query ("
      SELECT *
      FROM dogs
      WHERE id = #{id}
    ")
    Dog.new(results.first["name"], results.first["color"]).tap { |dog| dog.id = results.first["id"] }
  end

  def self.find_by_name(name)
    results = self.db.query ("
      SELECT *
      FROM dogs
      WHERE name = '#{name}'
    ")
    self.results_from_query(results)
  end

  def self.find_by_color(color)
    results = self.db.query ("
      SELECT *
      FROM dogs
      WHERE color = '#{color}'
    ")
    self.results_from_query(results)
  end

  def self.results_from_query(results)
    array = []
    results.each do |dog|
      array << Dog.new(dog["name"], dog["color"]).tap { |dog_obj| dog_obj.id = dog["id"] }
    end
    array
  end

  def insert
    results = self.db.query ("
      INSERT INTO dogs(name, color)
      VALUES ('#{@name}', '#{@color}')
    ")
    self.saved?(results)
    self.add_obj_id
  end

  def add_obj_id
    self.id = self.db.last_id if self.db.last_id > 0
  end

  def update
    results = self.db.query ("
      UPDATE dogs
      SET name = '#{@name}', color = '#{@color}'
      WHERE id = #{@id};
    ")
    self.saved?(results)
  end

  def delete
    results = self.db.query ("
      DELETE FROM dogs
      WHERE id = #{id}
    ")
    self.saved?(results)
  end

  def saved?(results)
    if results.nil?
      true
    else
      return false
    end
  end

  def save! # (a smart method that knows the right thing to do)
    if self.id == nil
      self.insert
    else
      self.update
    end
  end

  def unsaved?
    results = self.db.query ("
      SELECT *
      FROM dogs
      WHERE id = #{@id}
    ")
    if results.first["name"] == @name && results.first["color"] == @color
      return true
    else
      return false
    end
  end

  # def inspect
  #   puts "Yo dawg, I am a dog named #{@name}. Woof."
  # end

  def reload
    
  end

  def attributes
    
  end

  def new_from_db?
    
  end

end

dog = Dog.find_by_id(5)
debugger
puts 'hi'