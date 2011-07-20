require 'spec_helper'

describe GoNodes::Edge do

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

  it "should create a name using numerically named end points" do
    require 'bigdecimal'
    names = [BigDecimal("#{Math::PI}"), BigDecimal("#{Math::E}")]
    node1 = GoNodes::Node.new(names[0])
    node2 = GoNodes::Node.new(names[1])
    
    edge  = GoNodes::Edge.new(start_node: node1, end_node: node2)
    
    edge.name.should == "{#{names[0]},#{names[1]}}"
  end

  context 'when testing equality' do
    
    it 'should equate edges having the same properites' do
      node1 = GoNodes::Node.new(:A)
      node2 = GoNodes::Node.new(:B)
      node3 = GoNodes::Node.new(:A)
      node4 = GoNodes::Node.new(:B)
    
      edge1 = GoNodes::Edge.new(
        start_node: node1,
        end_node:   node2,
        directed:   true,
        weight:     10
      )
      edge2 = GoNodes::Edge.new(
        start_node: node3,
        end_node:   node4,
        directed:   true,
        weight:     10
      )

      edge1.should == edge2
    end
    
    it 'should not equate edges with only some similar properties' do
      node1 = GoNodes::Node.new(:A)
      node2 = GoNodes::Node.new(:B)
      node3 = GoNodes::Node.new(:A)
      node4 = GoNodes::Node.new(:C)
    
      edge1 = GoNodes::Edge.new(
        start_node: node1,
        end_node:   node2
      )
      edge2 = GoNodes::Edge.new(
        start_node: node3,
        end_node:   node4
      )
      
      edge1.should_not == edge2
    end
    
    it "shouldn't == directed with same endpoints but different directions" do
      node1 = GoNodes::Node.new(:A)
      node2 = GoNodes::Node.new(:B)
      node3 = GoNodes::Node.new(:B)
      node4 = GoNodes::Node.new(:A)
    
      edge1 = GoNodes::Edge.new(
        start_node: node1,
        end_node:   node2,
        directed:   true
      )
      edge2 = GoNodes::Edge.new(
        start_node: node3,
        end_node:   node4,
        directed:   true
      )
      
      edge1.should_not == edge2
    end
  
   it "should equate undirected edges with same endpoints in different order" do
     node1 = GoNodes::Node.new(:A)
     node2 = GoNodes::Node.new(:B)
     node3 = GoNodes::Node.new(:B)
     node4 = GoNodes::Node.new(:A)
   
     edge1 = GoNodes::Edge.new(
       start_node: node1,
       end_node:   node2,
       directed:   false
     )
     edge2 = GoNodes::Edge.new(
       start_node: node3,
       end_node:   node4,
       directed:   false
     )
     
     edge1.should == edge2
   end
  
  end
  
  context "when sorting" do
    
    it "should sort using nodes, weight, and is_directed" do
      node1 = GoNodes::Node.new(:A)
      node2 = GoNodes::Node.new(:B)
      node3 = GoNodes::Node.new(:A)
      node4 = GoNodes::Node.new(:D)
    
      edge1 = GoNodes::Edge.new(
        start_node: node3,
        end_node:   node4,
        directed:   true,
        weight:     10
      )
      edge2 = GoNodes::Edge.new(
        start_node: node1,
        end_node:   node2,
        directed:   true,
        weight:     10
      )
      
      [edge1, edge2].sort.should == [edge2, edge1]
      
    end
    
  end
  
  it "should output human readable information when printed" do
    node1 = GoNodes::Node.new(:A)
    node2 = GoNodes::Node.new(:B)
  
    edge  = GoNodes::Edge.new(
      start_node: node1,
      end_node:   node2,
      directed:   true,
      weight:     10
    )

    edge.to_s.should == 
"""      name: {:a,:b}
    weight: 10
 direction: A -> B"""
     
  end

end