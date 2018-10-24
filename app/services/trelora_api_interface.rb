class TreloraApiInterface

  def post(type, body)
    conn.post do |req|
      req.url build_endpoint[type]
      req.body = body.to_json
    end
  end

  private

  def conn
    Faraday.new(:url => 'https://www.trylora.com/') do |faraday|
      faraday.headers["Accept"] = 'application/json'
      faraday.adapter  Faraday.default_adapter
    end
  end

  def build_endpoint
    {
      members:    "api/v0/turing/members",
      properties: "api/v0/turing/properties",
      update:     "api/v0/turing/update_listing_consultation"
    }
  end
end
