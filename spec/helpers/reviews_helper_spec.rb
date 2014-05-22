require 'spec_helper'


describe ReviewsHelper do
	describe '#star_rating' do 
		it 'returns 5 filled stars' do 
			expect(star_rating(5)).to eq '★★★★★'
		end

		it 'returns x filled stars, with the remainder in white stars, if x<5'  do 
			expect(star_rating(3)).to eq '★★★☆☆'
		end

		specify 'if value is not a number, return it unchanged' do 

		end

		it 'rounds to the nearest whole star' do
			expect(star_rating(3.7)).to eq '★★★★☆'
		end
		# ★★★☆☆
	end
 
end
