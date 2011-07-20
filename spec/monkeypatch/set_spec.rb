require 'spec_helper'

describe Set do
  
  it "should have a last if it has a first" do
    set = Set.new
    set.should respond_to(:last) if set.respond_to? :first
  end

  it "should return the last value of the set" do
    set = Set.new
    
    set << "A"
    set << "M"
    set << "Z"
    
    set.last.should == "Z"
  end
  
  
end