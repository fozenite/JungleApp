class Rating < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  validates :product, presence: true

  validates :user, presence: true
  validates  :description,  presence: true
  validates_inclusion_of :rating, :in => 1..5
end
