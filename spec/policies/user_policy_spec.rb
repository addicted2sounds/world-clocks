require 'rails_helper'

describe UserPolicy do
  subject { UserPolicy.new user, timezone }
  let(:timezone) { create :timezone }
  let(:alias_timezone) { create :timezone }
  let(:resolved_scope) do
    UserPolicy::Scope.new(user, User.all).resolve
  end
  let(:user) { create :user }
  it { is_expected.to permit_action :create }

  describe '.permitted_attributes' do
    subject { UserPolicy.new(user, timezone).permitted_attributes }

    context 'when user' do
      let(:user) { create :user }
      it { is_expected.to eq [:email, :password, :password_confirmation] }
    end

    context 'when can manage users' do
      let(:user) { create :user, :manager }
      it { is_expected.to eq [:email, :password,
                              :password_confirmation, :role] }
    end
  end

  describe 'scope' do
    context 'when admin' do
      let(:user) { create :user, :admin }
      it { expect(resolved_scope).to include user }
    end
  end
end