class HomeController < ApplicationController
  require 'net/http'
  require 'json'

  def index
  end

  def search
    @image = DogFetcher.run(params[:query])
    respond_to do |format|
      format.turbo_stream
      format.html { render :index }
    end
  end
end
