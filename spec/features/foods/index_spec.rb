require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'When I search for foods' do
    before :each do
      visit root_path

      fill_in 'q', with: 'sweet potatoes'
      click_button 'Search'
    end

    it 'foods#index' do
      expect(current_path).to eq(foods_path)
    end

    it 'shows total results' do
      expect(page).to have_content('Total results')
      expect(page).to have_content(55579)
    end

    it 'returns a list of 10 items' do
      expect(page.all('li').count).to eq(10)
    end

    it 'shows the foods and their attributes' do
      expect(page).to have_content('GTIN/UPC code:')
      expect(page).to have_content('8901020020844')
      expect(page).to have_content('Description:')
      expect(page).to have_content('SWEET POTATOES')
      expect(page).to have_content('Brand Owner:')
      expect(page).to have_content('John W. Taylor Packing Co. Inc')
      expect(page).to have_content('Ingredients:')
      expect(page).to have_content('SWEET POTATOES.')
    end
  end
end