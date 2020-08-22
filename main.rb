# Main class which in techniacal called context class
# It does consisits of logic taht be done from the results of different strategic objects
require 'nokogiri'
require_relative './scraperapi.rb'
require_relative './proxycrawl.rb'

class Main
  def initialize(scrape)
    @scrape = scrape
  end

  def scrape=(scrape)
    @scrape = scrape
  end

  def fetch_product_details(url)
    page_html = Nokogiri::HTML(@scrape.scrape_product(url))
    puts page_html
    price = page_html.css('span#priceblock_ourprice').first
    puts "Hurahh!!!! Price of the product is #{price}"
  end
end

sapi_object = Main.new(Scraperapi.new)
sapi_object.fetch_product_details("https://www.amazon.in/dp/B07XWYCMQG")\

puts "\n\n"

pxwl_object = Main.new(Proxycrawl.new)
pxwl_object.fetch_product_details("https://www.amazon.in/dp/B07XWYCMQG")