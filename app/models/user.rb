class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ROLES = %w[receptionist doctor].freeze
  validates :role, inclusion: { in: ROLES }


  has_many :patients

  def receptionist?
    role == 'receptionist'
  end

  def doctor?
    role == 'doctor'
  end

  def name(first_name, last_name)
    "#{first_name} #{last_name}"
  end
end
