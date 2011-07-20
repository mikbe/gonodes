require 'spec_helper'

describe GoNodes::EdgeList do

  describe "a new EdgeList" do
    
    it "should initialize using a number of edges" do
      node_list = GoNodes::NodeList.new_with_count(4)
      edge_list = GoNodes::EdgeList.new_with_count(
        node_list: node_list, 
        count: 6
      )
      
      edge_list.count.should == 6
    end
    
    it "should initialize using a completeness percentage" do
      node_list = GoNodes::NodeList.new_with_count(4)
      edge_list = GoNodes::EdgeList.new_with_completeness(
        node_list: node_list, 
        completeness: 0.5
      )

      edge_list.count.should == 3
    end

    it "should create an empty set if no count or completeness are given" do
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
  
    it "should normalize completeness level if not evenly divisible to edges" do
      node_list = GoNodes::NodeList.new_with_count(5)
      edge_list = GoNodes::EdgeList.new(node_list)
    
      edge_list.populate_with_completeness(0.66)

      edge_list.completeness.should == 0.6
    end

    it "should create edges using the given nodes" do
      node_list = GoNodes::NodeList.new_with_count(2)
      edge_list = GoNodes::EdgeList.new(node_list)
      edge_list.populate_with_completeness(1.0)

      edge_list.first.start_node.name.should == "A"
    end
    
    it "should add new edge using edge parameters" do
      node_list = GoNodes::NodeList.new_with_count(2)
      edge_list = GoNodes::EdgeList.new(node_list)

      edge_list.possible_edges.each do |edge|
        edge_list.add_edge(start_node: edge[0], end_node: edge[1])
      end
      edge_list.first.start_node.should_not be_nil
    end

  end

  context "when populating using a number of edges" do
  
    it "should create the specified number of edges" do
      node_list = GoNodes::NodeList.new_with_count(5)
      edge_list = GoNodes::EdgeList.new(node_list)
    
      edge_list.populate_with_count(10)

      edge_list.count.should == 10
    end

  end

  context "when testing equality" do

    it "should equate edgelists with equal edges" do
      node_list1 = GoNodes::NodeList.new_with_names(%w{B A})
      edge_list1 = GoNodes::EdgeList.new(node_list1)
      edge_list1.populate_with_completeness(1.0)

      node_list2 = GoNodes::NodeList.new_with_names(%w{A B})
      edge_list2 = GoNodes::EdgeList.new(node_list2)
      edge_list2.populate_with_completeness(1.0)

      edge_list1.should == edge_list2
    end
    
    it "should not equate edgelists with unequal edges" do
      node_list1 = GoNodes::NodeList.new_with_names(%w{A B})
      edge_list1 = GoNodes::EdgeList.new(node_list1)
      edge_list1.populate_with_completeness(1.0)

      node_list2 = GoNodes::NodeList.new_with_names(%w{A C})
      edge_list2 = GoNodes::EdgeList.new(node_list2)
      edge_list2.populate_with_completeness(1.0)
      
      edge_list1.should_not == edge_list2
    end

  end

  it "should calculate an array of possible edges" do
    node_list = GoNodes::NodeList.new_with_names(%w{A B C})
    edge_list = GoNodes::EdgeList.new(node_list)
    
    edge_list.possible_edges.should == [
      [node_list["A"], node_list["B"]],
      [node_list["A"], node_list["C"]],
      [node_list["B"], node_list["C"]],
    ]
    
  end

  it "should output a human readable list when printed" do
    node_list = GoNodes::NodeList.new_with_count(3)
    edge_list = GoNodes::EdgeList.new(node_list)
    edge_list.populate_with_completeness(1.0)

    edge_list.to_s.should == 
      "      name: {\"a\",\"b\"}\n" + 
      "    weight: \n direction: \n\n" +
      "      name: {\"a\",\"c\"}\n" +
      "    weight: \n direction: \n\n" +
      "      name: {\"b\",\"c\"}\n" +
      "    weight: \n direction: "

  end

end