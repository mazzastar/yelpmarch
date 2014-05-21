require "spec_helper"

describe 'writing reviews' do 
	before{@restaurant = Restaurant.create(name: "McDonalds", address: "1 Highfield Road", cuisine: "Junk")	}

	specify 'writing reviews' do 
		visit '/restaurants'
		expect(page).to have_content '0 reviews'
	end

	it 'add the review to the restaurant' do 
		
		leave_review("This was decent", 4)

		expect(current_path).to eq '/restaurants'
		expect(page).to have_content 'This was decent'
		expect(page).to have_content '1 review'
	end

	# it 'can calculate ' do 
	# 	leave_review("This was decent", 4)
	# 	expect(page).to havecan calculate 

	# end


def leave_review(thoughts, rating)
	visit '/restaurants'
	click_link 'Review McDonalds'
	fill_in 'Thoughts', with: thoughts
	select rating.to_s, from: 'Rating'
	click_button 'Leave Review'

end


end


