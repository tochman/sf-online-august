require 'rails_helper'

RSpec.describe ShoppingCart, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :created_at }
    it { is_expected.to have_db_column :user_id}
  end

  describe 'dependencies' do
    it { is_expected.to belong_to :user }
  end

  describe 'validations' do
  end
end
