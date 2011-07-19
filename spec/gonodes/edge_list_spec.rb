require 'spec_helper'

describe GoNodes::EdgeList do

  let(:edge_list){GoNodes::EdgeList.new}
  
  it "should create an empty set of edges if none were specified when initialized" do
    edge_list.edges.should be_empty
  end
  
  it "should create edges when initialized with nodes and comlpeteness percentage"
  # it "should create edges when initialized with nodes and comlpeteness percentage" do
  #   graph = GoNodes::Graph.new(nodes: 4, completeness: 1.0)
  #   graph.edges.count.should == 6
  # end
  
  it "should create the maximum number of edges when completeness is 100%" do
    node_list = GoNodes::NodeList.new
    node_list.populate_with_count(4)
    
    edge_list.populate_with_completeness(node_list: node_list, completeness: 1.0)
    
    edge_list.edges.count.should == 6
  end
  
  # it "should normalize the completness level if the completeness level is not evenly divisible among the edges" do
  #   edges.generate_edges(nodes: 5, completeness: 0.66)
  #   graph.completeness.should == 0.6
  # end
  # 
  # it "should create a specified number of edges" do
  #   graph.generate_from_count(5)
  #   graph.edges.length.should == 5
  # end

end