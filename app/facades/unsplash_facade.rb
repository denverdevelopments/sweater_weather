class UnsplashFacade
  def self.get_images(query)
    output = UnsplashService.find_images(query)
    sorted = output[:results]
  end
end
