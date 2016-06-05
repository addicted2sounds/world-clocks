require 'rails_helper'

RSpec.describe User, :type => :model do
  describe 'specs' do
    it { is_expected.to have_secure_password }
    it { is_expected.to define_enum_for(:role).with [:user, :manager, :admin] }
  end

  describe 'relations' do
    it { is_expected.to have_many :timezones }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_uniqueness_of :email }
  end

  describe '.can_manage_alias_timezones?' do
    it 'is not allowed for regular user' do
      expect(create(:user).can_manage_alias_timezones?).to be_falsey
    end

    it 'is allowed for manager' do
      expect(create(:user, :manager).can_manage_alias_timezones?).to be_truthy
    end

    it 'is allowed for admin' do
      expect(create(:user, :admin).can_manage_alias_timezones?).to be_truthy
    end
  end
end
