class PropertyFacade
  attr_reader :name, :attributes

  def initialize(attributes)
    @attributes = attributes
  end

  def name
    @attributes[:result][:client][:client_info][:name]
  end

  def email
    @attributes[:result][:client][:client_info][:email]
  end

  def phone
    @attributes[:result][:client][:client_info][:phone]
  end

  def map
    google_address = @attributes[:result][:listing][:id].gsub(/[_-]/, '+')
    "https://www.google.com/maps/dir/?api=1&origin=Your+location&destination=#{google_address}"
  end

  def opted_in
    if @attributes[:result][:client][:opted_in][:result]
      "Yes"
    else
      "No"
    end
  end

  def found_us
    @attributes[:result][:client][:found_us]
  end

  def dollars(num)
    sprintf('%.2f',num).gsub('.00','').reverse.scan(/(\d*\.\d{1,3}|\d{1,3})/).join(',').reverse.prepend('$')
  end

  def zestimate
    dollars (@attributes[:result][:pricing_estimates][:zillow][:zestimate])
  end

  def z_low
    dollars(@attributes[:result][:pricing_estimates][:zillow][:low])
  end

  def z_high
    dollars(@attributes[:result][:pricing_estimates][:zillow][:high])
  end

  def hj_low
    dollars(@attributes[:result][:pricing_estimates][:home_junction][:low])
  end

  def hj_high
    dollars(@attributes[:result][:pricing_estimates][:home_junction][:high])
  end

  def hj_avg
    dollars(@attributes[:result][:pricing_estimates][:home_junction][:regional_avg])
  end

  def enthusiasm
    @attributes[:result][:client][:enthusiasm]
  end

  def timing
    @attributes[:result][:client][:timing]
  end

  def adopter_type
    @attributes[:result][:client][:adopter_type]
  end

  def updates
    @attributes[:result][:listing][:home_updates].values
  end

  def stage
    @attributes[:result][:client][:stage]
  end

  def retainer
    500
  end



end
