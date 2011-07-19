require 'spec_helper'

describe GoNodes::NodeList do

  let(:node_list){GoNodes::NodeList.new}
  
  it "should create an empty set of nodes if none were specified when initialized" do
    GoNodes::NodeList.new
    node_list.nodes.should be_empty
  end
  
  it "should create the specified number of nodes" do
    node_list.populate_with_count(4)
    node_list.nodes.count.should == 4
  end
    
  it "should name nodes alphabetically" do
    node_list.populate_with_count(4)
    node_list.nodes.last.name.should == "D"
  end
  
  it "should name nodes uniquely when there are more than 26 node_list" do
    node_list.populate_with_count(64 * 1024)
    node_list.nodes.last.name.should == "CRXP"
  end
  
  it "should create nodes using a provided array of names" do
    node_list.populate_with_names(%w{A B C 1 2 3})
    node_list.nodes.collect{|node| node.name}.sort.should == %w{A B C 1 2 3}.sort
  end


end