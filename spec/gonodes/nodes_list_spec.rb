require 'spec_helper'

describe GoNodes::NodeList do

  let(:node_list){GoNodes::NodeList.new}

  it 'should iterate over the nodes array directly' do
    node_list.populate_with_count(4)
    node_list.collect{|node| node.name}.should == %w{A B C D}
  end

  describe "a new NodeList" do
    
    it "should initialize using a number of nodes" do
      node_list = GoNodes::NodeList.new_with_count(15)
      node_list.last.name.should == "O"
    end
    
    it "should initialize using an array of node names" do
      node_list = GoNodes::NodeList.new_with_names(%w{A B C D E F G})
      node_list.last.name.should == "G"
    end
    
  end

  context "when populating the node list" do
  
    it "should create an empty set of nodes if none were specified when initialized" do
      GoNodes::NodeList.new
      node_list.should be_empty
    end
  
    it "should create the specified number of nodes" do
      node_list.populate_with_count(4)
      node_list.count.should == 4
    end
    
    it "should name nodes alphabetically" do
      node_list.populate_with_count(4)
      node_list.last.name.should == "D"
    end
    
    it "should name nodes alphabetically" do
      node_list.populate_with_count(4)
      node_list.first.name.should == "A"
    end
  
    it "should name nodes uniquely when there are more than 26 node_list" do
      node_list.populate_with_count(64 * 1024)
      node_list.last.name.should == "CRXP"
    end
  
    it "should create nodes using an array of node names" do
      node_list.populate_with_names(%w{A B C 1 2 3})
      node_list.collect{|node| node.name}.sort.should == %w{A B C 1 2 3}.sort
    end
    
  end

end