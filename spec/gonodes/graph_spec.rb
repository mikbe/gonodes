require 'spec_helper'

describe GoNodes::Graph do
  
  let(:graph) {GoNodes::Graph.new}

  context "When creating nodes" do

    it "should create an empty set of nodes if none were specified when initialized" do
      graph = GoNodes::Graph.new
      graph.nodes.should be_empty
    end
    
    it "should create the specified number of nodes" do
      graph.generate_nodes(4)
      graph.nodes.count.should == 4
    end
    
    it "should create the specified number of nodes when initialized" do
      graph = GoNodes::Graph.new(nodes: 4)
      graph.nodes.count.should == 4
    end
    
    it "should name nodes alphabetically" do
      graph.generate_nodes(4)
      graph.nodes.last.should == "D"
    end
    
    it "should name nodes uniquely when there are more than 26 nodes" do
      graph.generate_nodes(64 * 1024)
      graph.nodes.last.should == "CRXP"
    end
    
    it "should create nodes using a provided array of names" do
      graph.generate_named_nodes(%w{A B C 1 2 3})
      graph.nodes.sort.should == %w{A B C 1 2 3}.sort
    end
    
    it "should create nodes using a provided array of names when initialized" do
      graph = GoNodes::Graph.new(node_names: %w{D E F 7 5 4})
      graph.nodes.sort.should == %w{D E F 7 5 4}.sort
    end
    
  end

  context "When generating edges" do
    
    it "should create an empty set of edges if none were specified when initialized" do
      graph = GoNodes::Graph.new
      graph.edges.should be_empty
    end

    it "should create edges when initialized with nodes and comlpeteness percentage"
    # it "should create edges when initialized with nodes and comlpeteness percentage" do
    #   graph = GoNodes::Graph.new(nodes: 4, completeness: 1.0)
    #   graph.edges.count.should == 6
    # end

    it "should create the maximum number of edges when completeness is 100%" do
      graph = GoNodes::Graph.new(nodes: 4)
      graph.generate_edges(completeness: 1.0)
      graph.edges.count.should == 6
    end
    
    it "should normalize the completness level if the completeness level is not evenly divisible among the edges" do
      graph = GoNodes::Graph.new(nodes: 5)
      graph.generate_edges(completeness: 0.66)
      graph.completeness.should == 0.6
    end
    
    it "should create a specified number of edges" do
      graph = GoNodes::Graph.new(nodes: 5)
      graph.generate_edges(edges: 5)
      graph.edges.length.should == 5
    end
  
  end

  context "When naming edges" do
    
  end

  context "When compairing edges" do
    
    
    
    it "should equate edges ab to ba if they are bidirectional"
    
  end

end