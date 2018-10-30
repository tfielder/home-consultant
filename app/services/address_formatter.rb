class AddressFormatter
  def initialize(address)
    @address = address
    @parsed = StreetAddress::US.parse(@address)
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

  def formatter
    first_piece = [@parsed.number, street_prefix, @parsed.street.downcase, street_type].compact.join("_")
    second_piece = [@parsed.city, @parsed.state.upcase, @parsed.postal_code].compact.join("-")

    first_piece.concat("-").concat(second_piece)
  end

  private
    def street_type
      typo = @parsed.street_type.downcase
      typo = street_hash[typo] if street_hash.keys.include? typo
    end

    def street_prefix
      pre = @parsed.prefix.downcase
      pre = cardinal_abbv[pre] if cardinal_abbv.keys.include? pre
    end
end