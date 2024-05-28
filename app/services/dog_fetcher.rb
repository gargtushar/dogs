class DogFetcher
  require 'net/http'
  require 'json'

  attr_accessor :breed_name

  def initialize(breed_name)
    @breed_name = breed_name
  end

  def self.run(name)
    new(name).run
  end

  def run
    uri = URI("https://dog.ceo/api/breed/#{breed_name}/images/random/1")
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
    if response["status"] == "success"
      response["message"].first
    else
      return nil
    end
  end
end
