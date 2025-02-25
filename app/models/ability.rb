# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, BlogPost

    return unless user.present?

    UserAbility.new(user, self).define_ability
  end
end
