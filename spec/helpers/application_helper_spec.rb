require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do

  describe '#flash_class' do
    it 'returns \'alert alert-success\' on \'notice\'' do
      expect(helper.flash_class(:notice)).to eq 'alert alert-success'
    end
    it 'returns \'warning\' on \'warning\'' do
      expect(helper.flash_class(:alert)).to eq 'alert alert-danger'
    end
  end

  describe '#headline' do
    it 'returns headline for a route' do
      expect(helper.headline(path: '/restaurants/new')).to eq 'Create restaurant'
    end

    it 'returns default headline' do
      expect(helper.headline()).to eq 'Default headline'
    end
  end

end