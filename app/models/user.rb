# frozen_string_literal: true

class User < ApplicationRecord
  rolify
  # has_many :jogging_times
  after_create :assign_default_role

  # has_many :jogging_times, through: :roles, source: :resource, source_type:  :JoggingTime
  has_many :jogging_times, ->  { where(:roles => {name: :creator}) }, through: :roles, source: :resource, source_type:  :JoggingTime

  validate :must_have_a_role, on: :update


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtDenylist
  private
  def assign_default_role
    self.add_role(:regular) if self.roles.blank?
  end

  def must_have_a_role
    unless role.any?
      errors.add(:roles, 'Must at least have 1 rule')
    end
  end

end
