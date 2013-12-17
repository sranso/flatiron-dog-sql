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

  def find
    
  end

  def insert
    
  end

  def update
    self.db.query ("
      UPDATE dogs
      SET name = '#{@name}', color = '#{@color}'
      WHERE id = #{@id};
    ")
  end

  def delete
    
  end

  def destroy
    
  end

end

dog = Dog.find(1)
# dog.update
debugger
puts 'hi'

  # color, name, id
  # db
  # find_by_att
  # find
  # insert
  # update
  # delete/destroy

  # refactorings?
  # new_from_db?
  # saved?
  # save! (a smart method that knows the right thing to do)
  # unsaved?
  # mark_saved!
  # ==
  # inspect
  # reload
  # attributes

