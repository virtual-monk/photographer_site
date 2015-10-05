class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :albums
  has_many :photos, through: :albums
  has_many :packages
  has_many :categories

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :location, presence: true
  validates :years_experience, presence: true
  validates :user_id, presence: true

  def owner_or_admin?(logged_in_user)
    if logged_in_user == nil
      return false
    elsif user == logged_in_user || logged_in_user.admin
      return true
    end
  end

  def username
    return first_name + " #{last_name[0]}."
  end

end
