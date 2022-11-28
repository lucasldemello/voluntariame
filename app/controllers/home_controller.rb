class HomeController < ApplicationController
  def index
    @ngos = if params['search'].present?
              Ngo.search_ngos(params['search'])
            else
              Ngo.all.includes(:activities)
            end
  end
end
