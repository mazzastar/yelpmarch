require 'spec_helper'

describe Review do
  
  context 'ratings restriction' do 

  	it 'should not have a rating more than 5' do 
  		review = Review.new(thoughts: "awful", rating:10)
  		expect(review).to have(1).errors_on(:rating) 
  	end

  	it 'should not have a rating less than 1' do 
  		review = Review.new(thoughts: "awful", rating:0)
  		expect(review).to have(1).errors_on(:rating)
  	end

  end
end
