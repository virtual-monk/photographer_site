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

  mount_uploader :avatar, AvatarUploader

  searchable do
    string :first_name
    string :last_name
    string :location
    string :median_price
    integer :category_id, :multiple => true

    text :title, :body
    text :comments do
      comments.map { |comment| comment.body }
    end
  end

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
