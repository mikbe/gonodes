module GoNodes
  
  class Edge
    
    attr_accessor :name, :start_node, :end_node, :weight, :direction
    
    def initialize(args={})
      
      @start_node = args[:start_node] if args[:start_node]
      @end_node   = args[:end_node]   if args[:end_node]
    
      @weight     = args[:weight]     if args[:weight]

      @directed   = args[:directed]   if args[:directed]
      @directed ||= false
    
      set_direction
      create_name
      
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
    
    private 
    
    def convert_node_name(node)
      return node.name if node.name.is_a? Numeric
      "#{node.name.inspect}".downcase
    end
    
  end
  
end
