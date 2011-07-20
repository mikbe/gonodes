module GoNodes
  
  class Edge
    
    attr_accessor :name, :start_node, :end_node, :weight, :direction
    
    def initialize(params={})
      
      @start_node = params[:start_node] if params[:start_node]
      @end_node   = params[:end_node]   if params[:end_node]
    
      @weight     = params[:weight]     if params[:weight]

      @directed   = !!params[:directed] if params[:directed]
      @directed ||= false
    
      set_direction
      create_name
      
    end
    
    def to_s
      ["      name: #{@name}",
       "    weight: #{@weight}",
       " direction: #{@direction}"].join("\n")
    end
    
    def is_directed?
      @directed
    end
    
    def set_direction
      return unless is_directed? && @start_node && @end_node

      @direction = "#{@start_node.name} -> #{@end_node.name}"
    end
    
    def create_name
      return unless @start_node && @end_node
      start_name  = convert_node_name(@start_node)
      end_name    = convert_node_name(@end_node)
      
      @name = "{#{start_name},#{end_name}}"
    end
    
    def ==(other_edge)
      
      self_nodes  = [self.start_node, self.end_node]
      other_nodes = [other_edge.start_node, other_edge.end_node]

      unless self.is_directed? || other_edge.is_directed?
        self_nodes.sort!
        other_nodes.sort!
      end
      
      [self_nodes, self.is_directed?, self.weight] == 
        [other_nodes, other_edge.is_directed?, other_edge.weight]
    end
    
    def <=>(other_edge)
      self_nodes  = [self.start_node, self.end_node]
      other_nodes = [other_edge.start_node, other_edge.end_node]
      
      [self_nodes, self.is_directed?, self.weight] <=> 
        [other_nodes, other_edge.is_directed?, other_edge.weight]
    end
    
    private 
    
    def convert_node_name(node)
      return node.name if node.name.is_a? Numeric
      "#{node.name.inspect}".downcase
    end
    
  end
  
end
