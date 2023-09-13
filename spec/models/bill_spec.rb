require 'rails_helper'

RSpec.describe Bill, type: :model do
  let(:user) { User.create(name: 'Tom', password: 'password', email: 'tom@hostname.com') }
  let(:group) do
    Group.create(name: 'Group1', icon: '123.jpg', description: 'Description1', created_at: Time.now,
                 updated_at: Time.now, user_id: user.id)
  end

  subject do
    described_class.new(name: 'Tom', amount: 10, description: 'Description1', author_id: user.id,
                        group_id: group.id)
  end

  describe 'Validations' do
    it 'is invalid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is invalid without an amount' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end

    it 'amount should be >= 0' do
      subject.amount = -4
      expect(subject).to_not be_valid
    end

    it 'amount should be numeric' do
      subject.amount = 'One'
      expect(subject).to_not be_valid
    end
  end
end
