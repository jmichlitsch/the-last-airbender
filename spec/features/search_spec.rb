require 'rails_helper'

RSpec.describe 'index page' do 
   describe 'search function' do 
    it 'searches for members by nation' do 
        visit root_path
        select("Fire Nation", from: :nation)
        click_button("Search For Members")

        expect(current_path).to eq(search_path)
        expect(page).to have_content("Total Members: 97")
        expect(page).to have_css('.member', count: 25)

        members.each do |member|
            within("#member-#{member.id}") do 
                expect(page).to have_content(member.name)
                # expect(page).to have_css('img') if member.photo_url
                expect(page).to have_content("Allies: #{member.allies}")
                expect(page).to have_content("Enemies: #{member.eneimes}")
                expect(page).to have_content(member.affiliation)
            end
        end
    end
   end
end