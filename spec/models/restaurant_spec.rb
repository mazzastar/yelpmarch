require 'spec_helper'

describe Restaurant do

	context 'Restaurant creation' do 	
		it 'is not valid without a name' do 
			restaurant = Restaurant.new(name: nil)
			expect(restaurant).not_to be_valid
			expect(restaurant).to have(2).error_on(:name)
		end
		
		it 'is not valid without a address' do 
			restaurant = Restaurant.new(address: nil)
			expect(restaurant).not_to be_valid
			expect(restaurant).to have(2).errors_on(:address)
		end
		
		it 'is not valid without a cuisine' do 
			restaurant = Restaurant.new(cuisine: nil)
			expect(restaurant).not_to be_valid
			expect(restaurant).to have(1).error_on(:cuisine)
		end

		it 'is not valid with an address that is too short' do 
			restaurant = Restaurant.new( address: "1")
			expect(restaurant).to have(1).errors_on(:cuisine)
		end

		it 'is not valid unless it starts with an uppercase letter' do 
			restaurant = Restaurant.new(name: 'nandos')
			expect(restaurant).to have(1).errors_on(:name)
		end
	end


	describe '#average rating' do 
		let(:restaurant) { Restaurant.create(name: 'KFC', address:"1 Highfield Close", cuisine:"Chicken")}

		it 'initially returns N/A' do 
			expect(restaurant.average_rating).to eq 'N/A'
		end

		context 'it has 1 review' do 
			before {restaurant.reviews.create(rating: 3)}

			it 'returns the score of that review' do 
				expect(restaurant.average_rating).to eq 3
			end

		end

		context 'it has 2 review' do 
			
			it 'returns the score of that review' do
				restaurant.reviews.create(rating: 3) 
				restaurant.reviews.create(rating: 5)
				expect(restaurant.average_rating).to eq 4
			end

			it 'returns the score of that review' do
				restaurant.reviews.create(rating: 3) 
				restaurant.reviews.create(rating: 4)
				expect(restaurant.average_rating).to eq 3.5
			end

		end





	end
	# context 'Restaurant is ready to be reviewed' do
	# 	it 'should return N/A when there are no reviews' do 
	# 		restaurant = Restaurant.create(name: 'Nandos', address: "1 Highfield Road", cuisine: "Chicken")
	# 		restaurant.reviews.create(thoughts: "Great", rating:5)
	# 		restaurant.reviews.create(thoughts: "Not so Great", rating:1)

	# 	end

	# end

end
