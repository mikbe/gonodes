require 'spec_helper'

describe GoNodes::Graph do
  
  let(:graph) {GoNodes::Graph.new}
    
  it "should create the specified number of nodes" do
    graph = GoNodes::Graph.new(node_count: 4)
    graph.nodes.count.should == 4
  end
  
  it "should create nodes using a provided array of names" do
    graph = GoNodes::Graph.new(node_names: %w{D E F 7 5 4})
    graph.nodes.collect{|node| node.name}.sort.should == %w{D E F 7 5 4}.sort
  end
  
  it "should set the specified level of completeness" do
    graph = GoNodes::Graph.new(node_count: 4, completeness: 0.5)
    graph.completeness.should == 0.5
  end

  it "should set completeness to 100% if it is not specified" do
    graph = GoNodes::Graph.new(node_count: 4)
    graph.completeness.should == 1.0
  end

  it "should equate graphs will all things being equal" do
    graph1 = GoNodes::Graph.new(node_count: 4, completeness: 1.0)
    graph2 = GoNodes::Graph.new(node_count: 4, completeness: 1.0)
    graph1.should == graph2
  end

  it "should create not generate random graphs normally" do
    settings = {node_count: 50, completeness: 0.1, random_edges: false}
    graphs = 10.times.collect{GoNodes::Graph.new(settings)}
    
    graphs.combination(2).all? do |combo|
      combo[0] == combo[1]
    end.should be_true
    
  end

  it "should create randomly generated graphs" do
    settings = {node_count: 50, completeness: 0.1, random_edges: true}
    graphs = 10.times.collect{GoNodes::Graph.new(settings)}
    
    graphs.combination(2).any? do |combo|
      combo[0] != combo[1]
    end.should be_true
  end

  it "should make randomly weighted edges using a median and range" do
    settings = {
      node_count: 4, 
      random_weights: {median: 50, range: 10}
    }
    graphs = 10.times.collect{GoNodes::Graph.new(settings)}
    
    graphs.combination(2).any? do |combo|
      combo[0] != combo[1]
    end.should be_true
  end

  it "should print out a human readable represenation of the graph" do
    graph = GoNodes::Graph.new(node_count: 3, completeness: 1.0)
    graph.to_s.should == 
      "Nodes:\n" + 
      "A, B, C\n\n" + 
      "Edges:\n" + 
      "      name: {\"a\",\"b\"}\n" + 
      "    weight: \n direction: \n\n" + 
      "      name: {\"a\",\"c\"}\n" +
      "    weight: \n direction: \n\n" + 
      "      name: {\"b\",\"c\"}\n" + 
      "    weight: \n direction: "
  end

end