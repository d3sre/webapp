class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title
#  validates_presence_of :title, :description, :price
  validates :title, :description, :price, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.05}
  validates :title, :uniqueness => true
  validates :image_url, :format => { 
	:with => %r{\.(gif|jpg|png)$}i, 
	:message => 'must be a URL for GIF, JPG or PNG image'
}
end
