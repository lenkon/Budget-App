require 'rails_helper'

RSpec.describe Group, type: :model do
  before :each do
    @user = User.create(name: 'Tom', password: 'password', email: 'tom@hostname.com')
    @group = Group.create(name: 'Group1', icon: 'http://hostname/123.jpg', description: 'description',
                          user_id: @user.id)
  end

  describe 'Validations' do
    it 'is invalid without an icon' do
      @group.icon = 'Group'
      expect(@group).to_not be_valid
    end

    it 'is invalid without a name' do
      @group.name = nil
      expect(@group).to_not be_valid
    end
  end
end
