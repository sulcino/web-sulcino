# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    UserAbility.new(user, self).define_ability
  end
end
