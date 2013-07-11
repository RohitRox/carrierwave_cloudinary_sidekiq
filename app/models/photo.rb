class Photo < ActiveRecord::Base
  belongs_to :project
  attr_accessible :pic
  mount_uploader :pic, PicUploader
  store_in_background :pic
end
