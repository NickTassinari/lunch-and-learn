class Image 
  attr_reader :alt_tag, :url 
  def initialize(data)
    @alt_tag = data[:alt]
    @url = data[:src][:original]
  end
end