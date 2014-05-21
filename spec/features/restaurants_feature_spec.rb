require 'spec_helper'

describe 'restaurants index page' do
	context 'no restaurants have been added' do 
		it 'shoudl display a message' do 
			visit '/restaurants'
			expect(page).to have_content 'No restaurants yet'
		end
	end
end


describe 'creating a restaurant' do 
	context 'with valid data' do 
		it 'adds it to the restaurants index' do 
			visit '/restaurants/new'
			fill_in "Name", with: "McDonalds"
			fill_in "Address", with: "1 City Road, London"
			fill_in "Cuisine", with: "Junk"
			click_button "Create Restaurant"

			expect(current_path).to have_content '/restaurants'
			expect(page).to have_content 'McDonalds'
	 	end
 	end
 	context 'with invalid data' do 
 		it 'shows and error' do
			visit '/restaurants/new'
			fill_in 'Name', with: 'McDonalds'
			fill_in 'Address', with: '1'
			fill_in 'Cuisine', with: 'Junk'
			click_button 'Create Restaurant'

			expect(page).to have_content 'error'
		end
 	end

end

describe 'editing a restaurant' do 
	before(:each) do
		Restaurant.create(name: 'McDonalds', address: "1 Highfield Road", cuisine: "Junk")
  	end

  	context 'with valid data' do	
		it 'saves the changes to an existing restaurant' do 
			visit '/restaurants'
			expect(page).to have_content("McDonalds")
			click_on 'Edit'
			fill_in "Name", with: "KFC"
			fill_in "Cuisine", with: "Chicken"
			click_on 'Update'
			expect(page).to have_content("KFC")

		end
	end

	context 'with invalid data' do 
		it 'displays an error' do 
			visit '/restaurants'
			click_link 'Edit'
			fill_in 'Name', with: 'kfc'
			click_on 'Update'
			expect(page).to have_content "error"
		end 
	end


end

describe 'Remove a restaurant' do 
	before(:each) do
			Restaurant.create(name: 'McDonalds', address: "1 Highfield Road", cuisine: "Junk")
	end
	it 'deletes a restaurant' do
		visit '/restaurants'
		click_on 'Delete'
		expect(page).to_not have_content('McDonalds')
	end

end