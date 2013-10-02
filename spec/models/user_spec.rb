# encoding: UTF-8
require 'spec_helper'

describe User do


	it "is not saved without a proper password" do
		user = User.create name: "Dummy", password: "ymmud111"

		expect(user.valid?).to be(false)
		expect(User.count).to eq(0)
	end

	it "is not saved with too short name" do
		user = User.create name: "PP", password: "mysecret1", password_confirmation: "mysecret1"

		expect(user.valid?).to be(false)
		expect(User.count).to eq(0)
	end

	it "is not saved with password containing only character" do
		user = User.create name: "Pekka", password: "mysecret", password_confirmation: "mysecret"

		expect(user.valid?).to be(false)
		expect(User.count).to eq(0)
	end

	it "is not saved with too short password" do
		user = User.create name: "Pekka", password: "mys", password_confirmation: "mys"

		expect(user.valid?).to be(false)
		expect(User.count).to eq(0)
	end

	it "is not saved with too similar name and password" do
		user = User.create name: "Pekka", password: "Peeekka1", password_confirmation: "Peeekka1"

		expect(user.valid?).to be(false)
		expect(User.count).to eq(0)
	end
  
  
  
  

	describe "levenshtein distance" do
		let(:user) { FactoryGirl.create :user }

		it "has method to calculate it" do
			user.should respond_to :levenshtein_distance
		end

		it "calculates distance between 'ritari' and 'laturi'" do
			user.levenshtein_distance("ritari", "laturi").should be 3
		end

		it "calculates distance between 'kissa' and 'kassi'" do
			
			user.levenshtein_distance("kissa", "kassi").should be 2
		end

		it "calculates distance between 'pasi' and 'kasi'" do
			
			user.levenshtein_distance("pasi", "kasi").should be 1
		end


		it "calculates distance between 'jono' and 'jono'" do
			
			user.levenshtein_distance("jono", "jono").should be 0
		end
	end

end
