class AddressFormatter
  def initialize(address)
    @address = address
  end

  def street_hash
  {"St"=>:Street,
    "Cir"=>:Circle,
    "Ct"=>:Court,
    "ln"=>:Lane,
    "Dr"=>:Drive,
    "Pl"=>:Place,
    "Rd"=>:Road,
    "Ave"=>:Avenue,
    "blvd"=>:Boulevard,
    "way"=>:Way,
    "pkwy"=>:Parkway,
    "trl"=>:Trail,
    "lp"=>:loop,
    "rn"=>:Run}
  end

  def parsed
    parse = StreetAddress::US.parse(@address)
  end

  def format
    binding.pry
    parsed
    #take elements of parsed data and concat with _ or -

    "#{parsed.number}_#{parsed.prefix}_#{parsed.street}-#{parsed.city}-#{parsed.state}"
  end
end