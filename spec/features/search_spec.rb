require 'rails_helper'

RSpec.describe 'index page' do 
   describe 'search function' do 
    it 'searches for members by nation' do 
        visit root_path
        select("Fire Nation", from: :nation)
        click_button("Search For Members")

        expect(current_path).to eq(search_path)
        expect(page).to have_content("Total Members: 97")
    end
   end
end