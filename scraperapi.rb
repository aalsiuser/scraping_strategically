# ScraperApi strategy class
require 'rest-client'
require_relative './scrape.rb'

class Scraperapi < Scrape
  BASE_URL = 'http://api.scraperapi.com'.freeze
  RETRY_COUNT = 3

  def initialize
    @token = ENV['SCRAPER_API_TOKEN']
  end

  def scrape_product(url)
    begin
      retries ||= 0
      @response = RestClient.get(
        BASE_URL,
        query_params(url)
      )

      response.body
    rescue
      retry if (retries += 1) < RETRY_COUNT
    end

    
  end

  def query_params(url)
    {
      params:{
        key: @token,
        url: url
      }
    }
  end
end
