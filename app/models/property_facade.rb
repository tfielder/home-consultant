class PropertyFacade
   
  def initialize(attributes)
    @attributes = attributes
  end

  def name
    @attributes[:result][:client][:client_info][:name]
  end


end
