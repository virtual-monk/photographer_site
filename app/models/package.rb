class Package < ActiveRecord::Base
  belongs_to :profile

  validates :title, presence: true
  validates :details, presence: true
  validates :price, presence: true

  def package_owner_or_admin?(logged_in_user)


    profile.user == logged_in_user || logged_in_user.admin
  end
end
