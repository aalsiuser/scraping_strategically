# Proxycrawl Strategy class where the changes of its are totally dependent on it
require_relative './scrape.rb'
require 'proxycrawl'

class Proxycrawl < Scrape
  BASE_URL = 'https://api.proxycrawl.com'.freeze
  RETRY_COUNT = 3

  def initialize
    @token = ENV['PROXYCRAWL_TOKEN']
  end

  def scrape_product(url)
    begin
      retries ||= 0
      response = RestClient.get(
        BASE_URL,
        query_params(url)
      )

      response.body
    rescue
      retry if (retries += 1) < RETRY_COUNT
    end

    @response.body
  end

  def query_params(url)
    {
      params:{
        token: @token,
        url: url
      }
    }
  end
end