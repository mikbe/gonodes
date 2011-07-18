module GoNodes
  
  class Nodes

    attr_reader :nodes

    ASCII_A = 65

    def initialize
      @nodes = []
    end

    def generate_nodes(nodes)
      return unless nodes
      @nodes = []
      nodes.times {|index| @nodes << alpha_numberize(index+1)}
    end

    def generate_named_nodes(node_names)
      return unless node_names
      @nodes = []
      node_names.each {|name| @nodes << name}
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
    
    # this is just used for generating text to test against (so far)
    def numberize_alpha(text)
      number = 0
      text.upcase.reverse.split("").each_with_index do |char, index|
        number += ( char.ord + 1 - ASCII_A) * 26**index
      end
      number
    end
    
  end
  
end
