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

  def self.find(id)
    results = self.db.query ("
      SELECT *
      FROM dogs
      WHERE id = #{id}
    ")
    Dog.new(results.first["name"], results.first["color"]).tap { |dog| dog.id = results.first["id"] }
  end

  def find_by_name
    self.db.query ("
      SELECT *
      FROM dogs
      WHERE name = '#{@name}'
    ")
  end

  def find_by_color
    self.db.query ("
      SELECT *
      FROM dogs
      WHERE name = '#{@color}'
    ")
  end

  def insert
    self.db.query ("
      INSERT INTO dogs(name, color)
      VALUES ('#{@name}', '#{@color}')
    ")
  end

  def update
    self.db.query ("
      UPDATE dogs
      SET name = '#{@name}', color = '#{@color}'
      WHERE id = #{@id};
    ")
  end

  def delete
    self.db.query ("
      DELETE FROM dogs
      WHERE id = #{id}
    ")
  end

  def refactorings?
    
  end

  def new_from_db?
    
  end

  def saved?
    
  end

  def save! #(a smart method that knows the right thing to do)
    
  end

  def unsaved?
    
  end

  def mark_saved!
    
  end

  def inspect
    puts "Yo dawg, I am a dog named #{@name}"
  end

  def reload
    
  end

  def attributes
    
  end

end

dog = Dog.find(3)
debugger
puts 'hi'