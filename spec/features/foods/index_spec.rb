require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'When I search for foods' do
    before :each do
      visit root_path

      fill_in 'q', with: 'apple'
      click_button 'Search'
    end

    it 'foods#index' do
      expect(current_path).to eq(foods_path)
    end

    it 'shows total results' do
      expect(page).to have_content('Total results')
      expect(page).to have_content(26109)
    end

    it 'returns a list of 10 items' do
      expect(page.all('li').count).to eq(10)
    end

    it 'shows the foods and their attributes' do
      expect(page).to have_content('GTIN/UPC code:')
      expect(page).to have_content('867824000001')
      expect(page).to have_content('Description:')
      expect(page).to have_content('APPLE')
      expect(page).to have_content('Brand Owner:')
      expect(page).to have_content('TREECRISP 2 GO')
      expect(page).to have_content('Ingredients:')
      expect(page).to have_content('CRISP APPLE.')
    end
  end
end