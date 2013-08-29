class Url < ActiveRecord::Base

  validates :long_url , format: {with: /http[s]*:\/\/.*\..*/, 
    message: "Enter a valid URL"}

  before_create :shorten 


  def shorten
    self.shortened_url = SecureRandom.hex(4)
  end

end
