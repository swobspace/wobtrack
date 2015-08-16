class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :search, :to => :read

    @user = user
    if @user.nil?

    elsif @user.is_admin?
      can :manage, :all
      cannot [:update, :destroy], :roles, :ro => :true
    else
      can :navigate, [:tracks, :configuration]
      can :manage, Track, user_id: @user.id
      can :manage, Trackpoint, tracks: { user_id: @user.id }
      can :read, :all
    end

  end
end
