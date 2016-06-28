class PagesController < ApplicationController

  def home
  end

  def introduction
    @response = Response.new
  end

end
