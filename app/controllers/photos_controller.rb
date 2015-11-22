class PhotosController < ApplicationController
  mount_uploader :photo, AvatarUploader
  belongs_to :album

end
