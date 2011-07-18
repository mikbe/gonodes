require 'spec_helper'

describe GoNodes::Node do
  
  describe "a new node" do
    it "should set the specified name" do
      node = GoNodes::Node.new(:A)
      node.name.should == :A
    end
    
    it "should set its name to its object ID if no name is specified" do
      node = GoNodes::Node.new
      node.name.should == node.object_id
    end

  end
  
  context "when compairing" do
    
    it "should be able to tell two apart even if they have the same name" do
      node1 = GoNodes::Node.new("A")
      node2 = GoNodes::Node.new("A")
      node1.should_not == node2
    end
    
  end
  
end