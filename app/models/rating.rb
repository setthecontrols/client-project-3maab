class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  validates_presence_of :value
end
