class JoggingTime < ApplicationRecord
  # belongs_to :user
  resourcify
  has_many :creators, -> { where(roles: {name: :creator}) }, through: :roles, class_name: "User", source: :users
end
