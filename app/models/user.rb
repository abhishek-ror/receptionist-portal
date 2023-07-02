class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ROLES = %w[receptionist doctor].freeze

  has_many :patients

  def receptionist?
    role == 'receptionist'
  end

  def doctor?
    role == 'doctor'
  end
end
