class Package < ActiveRecord::Base
  belongs_to :profile

  validates :title, presence: true
  validates :details, presence: true
  vaildates :price, presence: true
end
