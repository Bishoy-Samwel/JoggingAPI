# frozen_string_literal: true

class User < ApplicationRecord
  has_many :jogging_times
  after_create :assign_default_role

  def assign_default_role
    self.add_role(:regular) if self.roles.blank?
  end
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtDenylist
end
