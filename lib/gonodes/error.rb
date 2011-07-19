module GoNodes
  
  module Error
    
    exceptions = [:NoNodeName] # %{NoNodeName SomeOtherError}
    exceptions.each {|e| const_set(e, Class.new(StandardError))}
    
  end
end