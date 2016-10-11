require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :description }
    it { is_expected.to have_db_column :price }
    it { is_expected.to have_db_column :allergies }
    it { is_expected.to have_db_column :calories }
    it { is_expected.to have_db_column :ingredients }
    it { is_expected.to have_db_column :highlight }
    it { is_expected.to have_db_column :image_file_name }
    it { is_expected.to have_db_column :image_content_type }
    it { is_expected.to have_db_column :image_file_size }

    it { is_expected.to have_and_belong_to_many :menus }
    it { is_expected.to belong_to :restaurant }
    it { is_expected.to have_attached_file :image }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :price }
    it { is_expected.to validate_presence_of :restaurant }
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(FactoryGirl.create(:dish)).to be_valid
    end
  end
end
