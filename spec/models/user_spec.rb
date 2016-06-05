require 'rails_helper'

RSpec.describe User, :type => :model do
  describe 'specs' do
    it { is_expected.to have_secure_password }
    it { is_expected.to define_enum_for(:role).with [:user, :manager, :admin] }
  end
end
