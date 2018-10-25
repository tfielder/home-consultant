class TreloraApiInterface
  def post(type, body)
    conn.post do |req|
      req.url build_endpoint[type]
      req.headers['Accept'] =  'application/json'
      req.body = body
    end
  end

  private

  def conn
    Faraday.new(:url => 'https://www.trylora.com/')
  end

  def build_endpoint
    {
      members:    "api/v0/turing/members",
      properties: "api/v0/turing/properties",
      update:     "api/v0/turing/update_listing_consultation"
    }
  end
end
