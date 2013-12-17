class FakeArray

  def initialize
    @storage = [1,2,3]
  end

  def each
    @storage.each do |element|
      yield element if block_given?
    end
  end

  def first
    @storage[0]
  end

end

# define each, first method, and allows you to work with them like arrays but is not an array
[1,2,3].each do |element|
  puts element
end

fa = FakeArray.new
fa.each do |element|
  puts element
end

class FakeBlockExample

  def initialize
    @to_say = "hello"
  end

  def say_hello
    puts "im in say hello"
    yield
    puts "im back in say hello at the end"
  end

end

# fbe = FakeBlockExample.new
# fbe.say_hello { puts "hello_from_the_block"}