require 'rails_helper'

RSpec.describe Timezone, :type => :model do
  describe 'relations' do
    it { is_expected.to belong_to :user }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :city }
    it 'validates difference numericality' do
      is_expected.to validate_numericality_of(:difference)
        .only_integer
        .is_greater_than_or_equal_to(-12)
        .is_less_than_or_equal_to(12)
    end
  end
end
