class ImagesController < ApplicationController
  def create
    @image = Image.new()
    @image.save
    @image.image.attach(params[:image])
    @image_url = url_for(@image.image)
    render json: {imageUrl: @image_url}
  end
end
