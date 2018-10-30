class PropertyFacade

  def initialize(attributes)

    @attributes = attributes
    require "pry"; binding.pry
  end

  def name
    @attributes[:result][:client][:client_info][:name]
  end

  def email
    @attributes[:result][:client][:client_info][:email]
  end

  def phone
    @attributes[:result][:client][:client_info][:phone]
  end

  def map
    array = @attributes[:result][:listing][:coordinates].to_a.flatten
    lat = array[1]
    long = array[3]
    "Lat: #{lat}, Long: #{long}"
  end

  def opted_in
    if @attributes[:result][:client][:opted_in][:result]
      "Yes"
    else
      "No"
    end 
  end




end
