class Product < ActiveRecord::Base
	mount_uploader :image, ImageUploader #mount an  uploaser called image, of  refereing to ImageUploader

	validates_presence_of :name, :price #ensures that these two are inputed
	validates_numericality_of :price  # makes price a number
end
