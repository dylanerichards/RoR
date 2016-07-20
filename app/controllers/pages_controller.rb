class PagesController < ApplicationController

  def home
    @user = User.new
  end

  def introduction
    @response = Response.new
  end

end
