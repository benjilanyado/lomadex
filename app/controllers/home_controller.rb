class HomeController < ApplicationController
  def index
  	@lists = List.order("created_at ASC").limit(5)
  end
end
