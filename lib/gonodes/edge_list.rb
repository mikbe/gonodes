module GoNodes
  
  class EdgeList < DelegateClass(Array)

    attr_reader :completeness

    def initialize(node_list)
      @node_list = node_list
      @edges = []
      super(@edges)
    end

    def self.new_with_count(args)
      edge_list = EdgeList.new(args[:node_list])
      edge_list.populate_with_count(args[:count])
      edge_list
    end

    def self.new_with_completeness(args)
      edge_list = EdgeList.new(args[:node_list])
      edge_list.populate_with_completeness(args[:completeness])
      edge_list
    end
    
    def populate_with_count(edge_count)
      @completeness = (edge_count.to_f / maximum_edges).round(2)

      @edges.clear
      edge_count.times do
        @edges << Edge.new
      end
    end

    def populate_with_completeness(completeness)
      edge_count = (maximum_edges * completeness).to_i
      populate_with_count(edge_count)
    end
    
    def maximum_edges
      (@node_list.count * (@node_list.count - 1)) / 2
    end
    
  end
  
end