class PricingEstimates

  def initialize(pricing_response)
    @pricing_response = pricing_response
  end

  def zestimate
    @pricing_response[:zillow][:zestimate]
  end

  def zest_low
    @pricing_response[:zillow][:low]
  end

  def zest_high
    @pricing_response[:zillow][:high]
  end

  def hj_low
    @pricing_response[:home_junction][:low]
  end

  def hj_high
    @pricing_response[:home_junction][:high]
  end

  def hj_regional_avg
    @pricing_response[:home_junction][:regional_avg]
  end
end
