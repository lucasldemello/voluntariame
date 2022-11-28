class HomeController < ApplicationController
  def index
    @ngos = Ngo.all.includes(:activities)
  end
end
