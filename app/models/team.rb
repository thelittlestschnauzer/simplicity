class Team < ApplicationRecord
  has_many :team_members
  has_many :users, through: :team_members

  accepts_nested_attributes_for :users, allow_destroy: true

  def user_attributes=(user_attributes)
    user_attributes.values.each do |user_attribute|
      user = User.find_or_create_by(user_attribute)
      self.users << user
    end
  end 
end
