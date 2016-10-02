require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :email }
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :address }
    it { is_expected.to have_db_column :encrypted_password }
    it { is_expected.to have_db_column :role }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :address }
    it { is_expected.to validate_presence_of :role }
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(FactoryGirl.create(:user)).to be_valid
    end
  end

  describe 'scopes' do
    let(:customer) {create(:user, role: 'customer')}
    let(:owner){create(:user, email: 'whatever@random_restaurant.com', role: 'owner')}

    it '#customers' do
      expect(User.customers).to include customer
      expect(User.customers).not_to include owner
    end

    it '#owners' do
      expect(User.owners).to include owner
      expect(User.owners).not_to include customer
    end

  end
end
