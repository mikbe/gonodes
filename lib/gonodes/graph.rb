module GoNodes
  
  class Graph

    attr_reader :nodes, :edges, :completeness

    ASCII_A = 65
    
    def initialize(args={})
      
      #@nodes = args[:nodes] if args[:nodes]
    
      #generate_edges
      
    end

    def generate_nodes(nodes)
      @nodes = Array.new(nodes)
      @nodes.each_index {|index| @nodes[index] = alpha_numberize(index+1)}
    end

    def generate_edges(completeness)
      
      #return {result: false, message: "No nodes have been set"} unless @nodes
      
      edge_value  = 1.0 / nodes.count
      left_over   = completeness % edge_value
      edge_count  = (completeness - left_over) / edge_value
      edge_count += edge_value - left_over >= edge_value / 2 ? 1 : 0
      
      @completeness = edge_value * edge_count

    end

    private
    
    # It's not a really a base 26 number conversion
    # 1 = A ... 26 = Z, 27 = AA, 28 = AB ... etc
    def alpha_numberize(number)
      alpha = ""
      begin
        number    -= 1
        remainder  = number % 26
        alpha     << remainder + ASCII_A
        number    /= 26
      end while number > 0
      alpha.reverse
    end
    
    def self.numberize_alpha(text)
      number = 0
      text.upcase.reverse.split("").each_with_index do |char, index|
        number += ( char.ord + 1 - ASCII_A) * 26**index
      end
      number
    end

    
    puts "BCDA: #{numberize_alpha('CRXP')}"
    # puts "DDAB: #{numberize_alpha('POTATO')}"
    # 
    # 
    # puts "52: #{alpha_numberize(64 * 1024)}"
    # puts "53: #{alpha_numberize(197309387)}"
    # 
  end
  
end


