class AddressFormatter
  def initialize(address)
    @address = address
  end

  def street_hash
  {"st"=>"street",
    "cir"=>"circle",
    "ct"=>"court",
    "ln"=>"lane",
    "dr"=>"drive",
    "pl"=>"place",
    "rd"=>"road",
    "ave"=>"avenue",
    "blvd"=>"boulevard",
    "way"=>"way",
    "pkwy"=>"parkway",
    "trl"=>"trail",
    "lp"=>"loop",
    "rn"=>"run"}
  end

  def cardinal_abbv
    {
      "n"=>"north",
      "e"=>"east",
      "s"=>"south",
      "w"=>"west",
      "n."=>"north",
      "e."=>"east",
      "s."=>"south",
      "w."=>"west",
      "ne"=>"northeast",
      "se"=>"southeast",
      "sw"=>"southwest",
      "nw"=>"northwest",
      "n.e."=>"northeast",
      "s.e."=>"southeast",
      "s.w."=>"southwest",
      "n.w."=>"northwest"
    }
  end

  def parsed
    parse = StreetAddress::US.parse(@address)
  end

  def formatter
    parsed
    street_type = parsed.street_type.downcase
    street_type = street_hash[street_type] if street_hash.keys.include? street_type
    street_prefix = parsed.prefix.downcase
    street_prefix = cardinal_abbv[street_prefix] if cardinal_abbv.keys.include? street_prefix

    first_piece = [parsed.number, street_prefix, parsed.street.downcase, street_type].compact.join("_")
    second_piece = [parsed.city, parsed.state, parsed.postal_code].compact.join("-")

    form = first_piece.concat("-").concat(second_piece)
  end
end