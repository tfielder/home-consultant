class PropertyService
  attr_reader :client,
              :pricing_estimates,
              :listing, :response

  def initialize( address, auth_token )
    @address           = address
    @auth_token        = auth_token
    @response          = parse_response
    @client            = build_client
    @pricing_estimates = build_pricing
    @listing           = build_listing
  end

  private

  def build_body
    {
      HTTP_AUTH_TOKEN: @auth_token,
      address:         @address
    }
  end

  def send_request
    TreloraApiInterface.new.post( :properties, build_body )
  end

  def parse_response
    @response ||= JSON.parse( send_request.body, symbolize_names: true )
  end

  def build_client
    Client.new(@response[:client])
  end

  def build_pricing
    PricingEstimates.new(@response[:pricing_estimates])
  end

  def build_listing
    Listing.new(@response[:listing])
  end
end
