require 'forwardable'

module GoNodes
  
  class Graph

    attr_reader :nodes, :edges

    def initialize(params={})

      @nodes = NodeList.new
      @nodes.populate_with_count(params[:node_count]) if params[:node_count]
      @nodes.populate_with_names(params[:node_names]) if params[:node_names]

      @edges = EdgeList.new(@nodes)
      completeness = params[:completeness] ? params[:completeness] : 1.0

      if params[:random_edges] && completeness != 1.0
        randomize_edges(completeness)
      else
        @edges.populate_with_completeness(completeness)
      end

      randomize_weights(params[:random_weights]) if params[:random_weights]
    end

    def completeness
      @edges.completeness
    end

    def ==(other_graph)
      @nodes == other_graph.nodes && @edges == other_graph.edges
    end

    def randomize_edges(completeness)
      edge_count = @edges.normalized_edge_count(completeness)
      edge_nodes = @edges.possible_edges.sample(edge_count)
      edge_nodes.each do |nodes|
        @edges.add_edge(start_node: nodes[0], end_node: nodes[1])
      end
    end

    def randomize_weights(random_weights)
      median = random_weights[:median]
      range  = random_weights[:range]
      @edges.each do |edge|
        edge.weight = median + rand(range) - (range / 2)
      end
    end

    def to_s
      "Nodes:\n#{@nodes.to_s}\n\nEdges:\n#{@edges.to_s}"
    end

  end

end