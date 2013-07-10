class Project < ActiveRecord::Base
  attr_accessible :title
  has_many :photos
  attr_accessible :photos_attributes
  accepts_nested_attributes_for :photos
end
