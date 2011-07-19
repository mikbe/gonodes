require 'spec_helper'

describe GoNodes::Edge do

  describe "a new edge" do

    it "should set its start node" do
      node1 = GoNodes::Node.new(:A)
      edge  = GoNodes::Edge.new(start_node: node1)
      edge.start_node.should == node1
    end

    it "should set its end node" do
      node2 = GoNodes::Node.new(:B)
      edge  = GoNodes::Edge.new(end_node: node2)
      edge.end_node.should == node2
    end

    it "should set its weight" do
      edge = GoNodes::Edge.new(weight: 4)
      edge.weight.should == 4
    end

    it "should set its direction" do
      edge = GoNodes::Edge.new(directed: true)
      edge.is_directed?.should be_true
    end

    it "should default to undirected if direction is not specified" do
      edge = GoNodes::Edge.new
      edge.is_directed?.should be_false
    end

    it "should set a direction of start_node -> end_node if it is directed" do
      node1 = GoNodes::Node.new(:A)
      node2 = GoNodes::Node.new(:B)
      
      edge  = GoNodes::Edge.new(start_node: node1, end_node: node2, directed: true)
      
      edge.direction.should == "A -> B"
    end

    it "should create a lower case name for itself based on its end points" do
      node1 = GoNodes::Node.new(:A)
      node2 = GoNodes::Node.new(:B)
      
      edge  = GoNodes::Edge.new(start_node: node1, end_node: node2)
      
      edge.name.should == "{:a,:b}"
    end

    it "should create a name for itself using numerically named end points" do
      require 'bigdecimal'
      names = [BigDecimal("#{Math::PI}"), BigDecimal("#{Math::E}")]
      node1 = GoNodes::Node.new(names[0])
      node2 = GoNodes::Node.new(names[1])
      
      edge  = GoNodes::Edge.new(start_node: node1, end_node: node2)
      
      edge.name.should == "{#{names[0]},#{names[1]}}"
    end

    
  end

end