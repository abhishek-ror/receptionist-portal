class Patient < ApplicationRecord

	validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true, numericality: { only_integer: true }

  belongs_to :user
  
  def name
    "#{first_name} #{last_name}"
  end
end