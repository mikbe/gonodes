module GoNodes
  
  class EdgeList < DelegateClass(Set)

    attr_reader :completeness

    def initialize(node_list)
      @node_list = node_list
      @edges = Set.new
      super(@edges)
    end
    
    def to_s
      @edges.map{|edge| edge.to_s}.join("\n\n")
    end

    def self.new_with_count(params)
      EdgeList.new(params[:node_list]).
        populate_with_count(params[:count])
    end

    def self.new_with_completeness(params)
      EdgeList.new(params[:node_list]).
        populate_with_completeness(params[:completeness])
    end

    def ==(other_edge_list)
      self.sort == other_edge_list.sort
    end
    
    def populate_with_count(edge_count)
      @completeness = (edge_count.to_f / maximum_edges).round(2)
      
      node_list_combo = possible_edges.cycle
      
      @edges.clear
      edge_count.times do
        start_node, end_node = node_list_combo.next
        @edges << Edge.new(
          start_node: start_node,
          end_node:   end_node 
        )
      end
      self
    end

    def populate_with_completeness(completeness)
      edge_count = normalized_edge_count(completeness)
      populate_with_count(edge_count)
    end

    def add_edge(edge_params)
      @edges << Edge.new(edge_params)
      self
    end

    def normalized_edge_count(completeness)
      (maximum_edges * completeness).to_i
    end
    
    # refactor after everything works - slow with more than a few hundred
    # if loopback edges are required I could use repeated_combination
    def possible_edges
      @possible_edges ||= @node_list.to_a.combination(2).to_a
    end
    
    def maximum_edges
      (@node_list.count * (@node_list.count - 1)) / 2
    end
    
  end
  
end