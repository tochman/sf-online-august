require 'rails_helper'

RSpec.describe 'Customer Abilities', type: :model do
  let(:customer) { create(:user, role: 'customer') }

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

  context 'Restaurants' do
    it 'can\'t be managed' do
      expect(subject).not_to be_able_to(:manage, Restaurant.new)
    end

    it 'can be read' do
      expect(subject).to be_able_to(:read, Restaurant.new)
    end
  end

  context 'Cart' do
    it 'can create ShoppingCarts' do
      expect(subject).to be_able_to(:create, ShoppingCart.new)
    end

  end


end