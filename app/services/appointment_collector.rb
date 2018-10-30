class AppointmentCollector

  def initialize(appointment_info, auth_token, email)
    @appointment_info = appointment_info
    @auth_token = auth_token
    @email = email
    response
  end

  def build_body
    {
      HTTP_AUTH_TOKEN: @auth_token,
      email: @email,
      address: @appointment_info[:consultation][:address],
      about_this_home: @appointment_info[:consultation][:about_this_home],
      client_enthusiasm: @appointment_info[:consultation][:client_enthusiasm],
      commission: @appointment_info[:consultation][:commission],
      about_the_seller: @appointment_info[:consultation][:about_the_seller],
      credit_card: @appointment_info[:consultation][:credit_card],
      exp_date: @appointment_info[:consultation][:exp_date],
      price: @appointment_info[:consultation][:price]
    }
  end

  def send_data
    TreloraApiInterface.new.post(:update, build_body)
  end

  def response
    @response ||= JSON.parse(send_data.body, symbolize_names: true)
  end

  def about_this_home
    @response[:listing_consultation][:consultation][:about_this_home]
  end

  def client_enthusiasm
    @response[:listing_consultation][:consultation][:client_enthusiasm]
  end

  def commission
    @response[:listing_consultation][:consultation][:commission]
  end

  def about_the_seller
    @response[:listing_consultation][:consultation][:about_the_seller]
  end

  def credit_card
    @response[:listing_consultation][:consultation][:credit_card]
  end

  def exp_date
    @response[:listing_consultation][:consultation][:exp_date]
  end
end
