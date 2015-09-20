class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :albums
  has_many :photos, through: :albums
  has_many :packages
  has_many :categories

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :location, presence: true
  vaildates :years_experience, presence: true

  def owner_or_admin?(logged_in_user)
    user == logged_in_user || logged_in_user.admin
  end
end
