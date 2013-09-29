require 'spec_helper'

describe "Rooms page" do
  include SigninHelper
  
  before :each do
	@user = FactoryGirl.create :user
	visit rooms_path
  end

  it "should not have any before been created" do
  
    expect(page).to have_content 'Listing rooms'
    expect(page).to_not have_link 'Edit'
  end
  
  
  describe "creating new" do
	it "should have link to create new one" do
	  expect(page).to have_link 'New Room'
	end
	it "should have form to create one" do
	  sign_in(@user.name, @user.password)
	  visit new_room_path
      
      fill_in('room_name', :with => 'B223')
      fill_in('room_description', :with => 'linkki tyotila')
      fill_in('room_capacity', :with => '10')
      fill_in('room_floor', :with => '2')
      click_button('Create Room')

      expect(page).to have_content 'linkki'
      expect(page).to have_content 'tila'
      expect(page).to have_content '10'
      expect(page).to have_content '2'
	end
  end
end
