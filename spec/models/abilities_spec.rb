require 'rails_helper'

RSpec.describe Ability, type: :model do
  let(:customer) { create(:user, role: 'customer') }
  let(:owner) { create(:user, email: 'owner@randon_restaurant.com', role: 'owner') }


  describe 'for Customer' do
    subject { Ability.new(customer) }

    context 'Menus' do
      it 'can\'t be managed' do
        expect(subject).not_to be_able_to(:manage, Menu.new)
      end

      it 'can be read' do
        expect(subject).to be_able_to(:read, Menu.new)
      end
    end

    context 'Dishes' do
      it 'can\'t be managed' do
        expect(subject).not_to be_able_to(:manage, Dish.new)
      end

      it 'can be read' do
        expect(subject).to be_able_to(:read, Dish.new)
      end
    end

    context 'Cart' do
      it 'can manage Menus' do
        expect(subject).to be_able_to(:manage, ShoppingCart.new)
      end

    end

  end

  describe 'for Owner' do
    subject { Ability.new(owner) }
    it 'can manage Menus' do
      expect(subject).to be_able_to(:manage, Menu.new)
    end
    it 'can manage Dishes' do
      expect(subject).to be_able_to(:manage, Menu.new)
    end


  end

end