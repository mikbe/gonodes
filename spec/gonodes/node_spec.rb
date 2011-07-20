require 'spec_helper'

describe GoNodes::Node do
  
  describe "a new node" do
    
    it "should set the specified name" do
      node = GoNodes::Node.new("A")
      node.name.should == "A"
    end
    
    it "should set its name to its object ID if no name is specified" do
      node = GoNodes::Node.new
      node.name.should == node.object_id
    end

    it "should set any type of number as its name" do
      require 'bigdecimal'
      numbers = [42, 4.2, BigDecimal("#{Math::PI}")]
      numbers.collect {|name| GoNodes::Node.new(name).name}.should == numbers
    end

    it "should raise an exception if something other than alphanumerics or numbers are given as a name" do
      expect{GoNodes::Node.new(String)}.should raise_error(GoNodes::Error::BadNodeName)
    end

  end

  it 'should not change its name if the object that originally specified its name changes' do
    name = "A"
    node = GoNodes::Node.new(name)
    expect{name.succ!}.should_not change(node, :name) 
  end
    
  it "should equate two nodes with the same name" do
    node1 = GoNodes::Node.new("A")
    node2 = GoNodes::Node.new("A")
    node1.should == node2
  end
  
  it "should sort by node name" do
    node1 = GoNodes::Node.new("Z")
    node2 = GoNodes::Node.new("A")
    
    [node1, node2].sort.should == [node2, node1]
  end
  
  it "should output its name when printed" do
    node1 = GoNodes::Node.new("Z")
    node1.to_s.should == "Z"
  end
  
end