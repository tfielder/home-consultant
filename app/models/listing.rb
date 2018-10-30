class Listing
  def initialize(listing_response)
    @listing_response = listing_response
  end

  def latitude
    @listing_response[:coordinates][:latitude]
  end

  def longitude
    @listing_response[:coordinates][:longitude]
  end

  def id
    @listing_response[:id]
  end

  def mls
    @listing_response[:mls]
  end

  def interior
    @listing_response[:home_updates][:interior]
  end

  def exterior
    @listing_response[:home_updates][:exterior]
  end

  def address_1
    @listing_response[:address][:address1]
  end

  def address_2
    @listing_response[:address][:address2]
  end

  def city
    @listing_response[:address][:city]
  end

  def state
    @listing_response[:address][:state]
  end

  def zip
    @listing_response[:address][:zip]
  end

  def baths
    @listing_response[:baths]
  end

  def beds
    @listing_response[:beds]
  end
end
