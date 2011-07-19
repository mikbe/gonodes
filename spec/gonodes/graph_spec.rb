require 'spec_helper'

describe GoNodes::Graph do
  
  let(:graph) {GoNodes::Graph.new}

  context "When creating nodes" do
    
    it "should create the specified number of nodes when initialized" do
      graph = GoNodes::Graph.new(node_count: 4)
      graph.nodes.count.should == 4
    end
    
    it "should create nodes using a provided array of names when initialized" do
      graph = GoNodes::Graph.new(node_names: %w{D E F 7 5 4})
      graph.nodes.collect{|node| node.name}.sort.should == %w{D E F 7 5 4}.sort
    end
    
  end

  context "When generating edges" do
  
  end

  context "When naming edges" do
    
  end

  context "When compairing edges" do
    
    
    
    it "should equate edges ab to ba if they are bidirectional"
    
  end

end