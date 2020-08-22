# This the main strategy pattern where it acts asa parent class
class Scrape

  def scrape_product
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

end