require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(name: 'Tom', password: 'password', email: 'tom@hostname.com')
  end

  describe 'Validations' do
    it 'has valid attributes' do
      expect(subject).to be_valid
    end

    it 'is invalid without a password' do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it 'is invalid without an email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'is invalid without an name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end
end
