require 'spec_helper'

describe GoNodes::Graph do
  
  let(:graph) {GoNodes::Graph.new}

  it "should have nodes" do
    graph.should respond_to(:nodes)
  end
  
  it "should have edges" do
    graph.should respond_to(:edges)
  end
  
  it "should have completeness" do
    graph.should respond_to(:completeness)
  end

  context "When creating nodes" do
    
    it "should create nodes if given a number" do
      graph.generate_nodes(4)
      graph.nodes.count.should == 4
    end
    
    it "should automatically name nodes" do
      graph.generate_nodes(4)
      graph.nodes.last.should == "D"
    end
    
    it "should properly name nodes with counts greater than 26" do
      graph.generate_nodes(65536)
      graph.nodes.last.should == "CRXP"
    end
    
  end

  context "When generating edges" do

    it "should set a normalized completness level if the amount given does is not properly divisible" do
      # graph = GoNodes::Graph.new(nodes: 4)
      # graph.generate_edges(completeness: 0.66)
      # graph.completeness.should == 0.5
    end

    it "should create edges based on completeness" do
      # graph = GoNodes::Graph.new(nodes: 4)
      # graph.generate_edges(completeness: 1.0)
      #graph.edges.count.should == graph.nodes.count
    end
    
  end

  context "When initializing" do

    it "should accept a hash for parameters" do
      #GoNodes::Graph.new(nodes: 4).nodes.should == 4
    end
    
  end
  
end