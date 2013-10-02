require 'spec_helper'

describe Faculty do
  	it "is not saved without a name" do
		faculty = Faculty.create description: "Dummy"

		expect(faculty.valid?).to be(false)
		expect(Faculty.count).to eq(0)
	end

	it "is not saved with too short name" do
		faculty = Faculty.create name: "tooShort", description: "Dummy"

		expect(faculty.valid?).to be(false)
		expect(Faculty.count).to eq(0)
	end
	
	
	it "is is saved with valid name" do
		faculty = Faculty.create name: "not Too Short", description: "Dummy"

		expect(faculty.valid?).to be(true)
		expect(Faculty.count).to eq(1)
	end
end
