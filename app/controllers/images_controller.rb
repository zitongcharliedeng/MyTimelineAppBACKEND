class ImagesController < ApplicationController
  def create
    @image = Image.new()
    @image.save
    if (params[:image] != "null")
      @image.image.attach(params[:image])
      @image_url = url_for(@image.image)
      render json: {imageUrl: @image_url}
    else
      render json: {imageUrl: "https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg"}
    end
  end
end
