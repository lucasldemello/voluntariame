class HomeController < ApplicationController
  def index
    @ngos = Ngo.all
  end
end
