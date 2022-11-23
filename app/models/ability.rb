# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :all, Group do |group|
      group.user == user
    end

    can :manage, :all, Entity do |entity|
      entity.user == user
    end
  end
end
