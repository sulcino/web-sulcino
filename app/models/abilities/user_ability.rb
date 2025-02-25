class UserAbility
  def initialize(user, abililty)
    @user = user
    @ability = abililty
  end

  def define_ability
    if @user.admin?
      @ability.can :manage, :all
    else
      @ability.can :manage, MessageOfTheDay, user_id: @user.id
    end
  end
end
