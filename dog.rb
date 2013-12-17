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

  def self.find(id)
    self.db.query ("
      SELECT *
      FROM dogs
      WHERE dogs.id = #{id}
    ")
  end

end

dog = Dog.find(10)
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

