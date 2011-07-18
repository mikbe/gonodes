require 'forwardable'

class Foo
  attr_accessor :qix
  
  def initialize
    @boo = "42"
  end
  
  def quix(value)
    @qix = value
  end
  
  private
  
  def boo
    @boo
  end
  
end


class Bar
  extend Forwardable
  def_delegators :@foo, :qix, :qix=, :quix, :boo

  def initialize
    @foo = Foo.new
    quix("potato")
  end
  
end

b = Bar.new

puts b.qix
puts b.boo