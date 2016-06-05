require 'rails_helper'

describe TimezonePolicy do
  subject { TimezonePolicy.new user, timezone }
  let(:timezone) { create :timezone }
  let(:alias_timezone) { create :timezone }
  let(:resolved_scope) do
    TimezonePolicy::Scope.new(user, Timezone.all).resolve
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