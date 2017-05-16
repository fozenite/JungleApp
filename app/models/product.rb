class Product < ActiveRecord::Base
  attr_accessor :ratings_attributes
  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category
  has_many :ratings
  accepts_nested_attributes_for :ratings

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

end
