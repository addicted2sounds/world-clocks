require 'rails_helper'

describe TimezonePolicy do
  subject { TimezonePolicy.new user, timezone }
  let(:timezone) { create :timezone }
  let(:alias_timezone) { create :timezone }
  let(:resolved_scope) do
    TimezonePolicy::Scope.new(user, Timezone.all).resolve
  end
  let(:user) { create :user }
  it { is_expected.to permit_action :create }

  describe '.permitted_attributes' do
    subject { TimezonePolicy.new(user, timezone).permitted_attributes }

    context 'when user' do
      let(:user) { create :user }
      it { is_expected.to eq [:name, :city, :difference] }
    end

    context 'when manager' do
      let(:user) { create :user, :manager }
      it { is_expected.to eq [:name, :city, :difference, :user_id] }
    end
  end

  describe 'scope' do
    context 'when user' do
      let(:user) { timezone.user }
      it { expect(resolved_scope).to include timezone }
      it { expect(resolved_scope).not_to include alias_timezone }
    end

    context 'when manager' do
      let(:user) { create :user, :manager }
      it { expect(resolved_scope).to include timezone }
      it { expect(resolved_scope).to include alias_timezone }
    end
  end
end