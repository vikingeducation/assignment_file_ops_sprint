require 'spec_helper'

describe Dictionary do
	describe '#initialize' do
		it 'returns an instance of the Dictionary class' do
			expect(Dictionary.new).to be_an_instance_of(Dictionary)
		end
	end
end