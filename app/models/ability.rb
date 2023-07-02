# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    if user.receptionist?
      can :manage, Patient
    elsif user.doctor?
      can :read, Patient
      can :access, :doctor_portal
    end
  end
end
