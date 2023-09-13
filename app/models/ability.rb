class Ability
  include CanCan::Ability

  def initialize(user)
    can :create, Group
    can :create, Bill

    can :update, Group do |group|
      group.user == user
    end

    can :destroy, Group do |group|
      group.user == user
    end

    can :update, Bill do |bill|
      bill.author == user
    end

    can :destroy, Bill do |bill|
      bill.author == user
    end
  end
end
