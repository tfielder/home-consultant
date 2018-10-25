class MembersService
  attr_reader :success

  def initialize( email, password )
    @email    = email
    @password = password
    @response = nil
    @success  = authenticate
  end

  private

  def authenticate
    check_successful_authentication
  end

  def build_body
    {
      email:    @email,
      password: @password
    }
  end

  def send_auth
    TreloraApiInterface.new.post( :members, build_body )
  end

  def parse_auth_response
    @response ||= JSON.parse( send_auth.body, symbolize_names: true )
  end

  def check_successful_authentication
    if parse_auth_response[:success]
      parse_auth_response[:data][:user][:HTTP_AUTH_TOKEN]
    else
      false
    end
  end
end
