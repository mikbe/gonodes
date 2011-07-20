require 'spec_helper'

describe GoNodes::NodeList do

  let(:node_list){GoNodes::NodeList.new}

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
  
    it "should create an empty set if none were specified when initialized" do
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

  context "when accessing the node list using square brackets []" do
    
    it "should return the Node object matching the node name" do
      node_list.populate_with_count(4)
      node_list["A"].should eql(node_list.first)
    end
    
    it "should not use the index of keys but the keys themselves" do
      node_list.populate_with_names([10,11,12,13])
      node_list[0].should be_nil
    end
    
    it "should return the correct node when using numbers" do
      node_list.populate_with_names([10.4,11.6,12.1,13.78])
      node_list[13.78].should eql(node_list.last)
    end
    
  end

  context "when testing equality" do

    it "should equate regardless of order" do
      node_list1 = GoNodes::NodeList.new_with_names(%w{A B})
      node_list2 = GoNodes::NodeList.new_with_names(%w{B A})
      
      node_list1.should == node_list2
    end

  end

  it "it should print out a human readable list of nodes" do
    node_list = GoNodes::NodeList.new_with_names(%w{A B})
    
    node_list.to_s.should == "A, B"
  end

  it "should add a GoNodes::Node using a name" do
    node_list = GoNodes::NodeList.new_with_names(%w{A B})
    
    node_list.add("C")
    node_list.last.should == GoNodes::Node.new("C")
  end



end