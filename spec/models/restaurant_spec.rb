require 'rails_helper'

RSpec.describe Restaurant, type: :model do

  it {is_expected.to belong_to :user}
  it {is_expected.to validate_presence_of :user}

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:restaurant)).to be_valid
    end
  end


end
