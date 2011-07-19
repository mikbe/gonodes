require 'spec_helper'

describe GoNodes::EdgeList do

  describe "a new EdgeList" do
    
    it "should initialize using a number of edges" do
      node_list = GoNodes::NodeList.new_with_count(4)
      edge_list = GoNodes::EdgeList.new_with_count(node_list: node_list, count: 6)
      
      edge_list.count.should == 6
    end
    
    it "should initialize using a completeness percentage" do
      node_list = GoNodes::NodeList.new_with_count(4)
      edge_list = GoNodes::EdgeList.new_with_completeness(node_list: node_list, completeness: 0.5)
      
      edge_list.count.should == 3
    end

    it "should create an empty set if neither a count nor a completeness percentage were specified" do
      node_list = GoNodes::NodeList.new_with_count(4)
      edge_list = GoNodes::EdgeList.new(node_list)

      edge_list.should be_empty
    end
    
  end
  
  context "when populating using a completeness percentage" do
    
    it "should create the appropriate number of edges" do
      node_list = GoNodes::NodeList.new_with_count(4)
      edge_list = GoNodes::EdgeList.new(node_list)
    
      edge_list.populate_with_completeness(1.0)
    
      edge_list.count.should == 6
    end
  
    it "should normalize the completeness level if it's not evenly divisible among the edges" do
      node_list = GoNodes::NodeList.new_with_count(5)
      edge_list = GoNodes::EdgeList.new(node_list)
    
      edge_list.populate_with_completeness(0.66)

      edge_list.completeness.should == 0.6
    end

  end

  context "when populating using a number of edges" do
  
    it "should create the specified number of edges" do
      node_list = GoNodes::NodeList.new_with_count(5)
      edge_list = GoNodes::EdgeList.new(node_list)
    
      edge_list.populate_with_count(10)

      edge_list.count.should == 10
    end

    # it "should not create more than the possible number of edges"
    #
    # I'm not adding this test because it should be able to 
    # create edged for more than simple graphs if expanded upon.

  end

end