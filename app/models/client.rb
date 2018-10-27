class Client

  def initialize(client_response)
    @client_response = client_response
  end

  def name
    @client_response[:client_info][:name]
  end

  def email
    @client_response[:client_info][:email]
  end

  def phone
    @client_response[:client_info][:phone]
  end

  def opted_in
    @client_response[:opted_in][:result]
  end

  def found_us
    @client_response[:found_us]
  end

  def enthusiasm
    @client_response[:enthusiasm]
  end

  def timing
    @client_response[:timing]
  end

  def adopter_type
    @client_response[:adopter_type]
  end

  def stage
    @client_response[:stage]
  end
end

