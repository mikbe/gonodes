require 'forwardable'

module GoNodes
  
  class Graph
    extend Forwardable

    def_delegators :@nodes_instance, :generate_nodes, :generate_named_nodes, :nodes
    def_delegators :@edges_instance, :generate_edges, :edges

    attr_reader :completeness
    
    def initialize(args={})
      
      @nodes_instance = Nodes.new
      @edges_instance = Edges.new

      generate_nodes(args[:nodes])            if args[:nodes]
      generate_named_nodes(args[:node_names]) if args[:node_names]
      
      generate_edges(args[:completeness])     if args[:completeness]
      
    end

    
    #puts "BCDA: #{numberize_alpha('CRXP')}"
    # puts "DDAB: #{numberize_alpha('POTATO')}"
    # 
    # 
    # puts "52: #{alpha_numberize(64 * 1024)}"
    # puts "53: #{alpha_numberize(197309387)}"
    # 
  end
  
end


