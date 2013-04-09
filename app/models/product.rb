class Product < ActiveRecord::Base
  default_scope :order => 'title'
  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  # ensure
  def ensure_not_referenced_by_any_line_item
  if line_items.count.zero?
   return true
  else
     errors[:base] << "Line Items preset"
     return false
  end
 end
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
