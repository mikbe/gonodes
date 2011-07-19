class MyException < StandardException
  class << self
    attr_accessor :message
  end
end

se = StandardError.new("Oops")
ex = Exception.new("Buggered it up")

se.instance_variable_set :@message, "Fudge"

puts se.inspect
puts ex.inspect

puts Exception.class

raise ex