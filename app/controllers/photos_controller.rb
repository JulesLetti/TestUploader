class PhotosController < ApplicationController


  # GET /photos/1
  # GET /photos/1.json

    def index
      @photos = Photo.order('created_at')
    end

    def new
      @photo = Photo.new
    end

    def create
      @photo = Photo.new(photo_params)

      if @photo.save
        flash[:success] = "The video will be send to you shortly!"
        redirect_to root_path
      else
        render 'new'
      end
    end

    def destroy
        @photo.destroy
        respond_to do |format|
          format.html { redirect_to root_path, notice: 'Video was successfully destroyed.' }
          format.json { head :no_content }
        end
      end



    private

    def photo_params
      params.require(:photo).permit(:image, :title, :email)
    end
end
