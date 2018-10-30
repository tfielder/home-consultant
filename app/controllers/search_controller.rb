class SearchController < ApplicationController
  def new

  end

  def create
    require "pry"; binding.pry
    af = AddressFormatter.new(params[:address]).formatter
  end
end
