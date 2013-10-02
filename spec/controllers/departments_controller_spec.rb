# encoding: UTF-8

require 'spec_helper'

describe DepartmentsController do

  let(:valid_attributes) { { "name" => "Tietojenkäsittelytieteen laitos" } }
  let(:valid_session) { {} }
  
  describe "when user is logged in" do

		let(:user) { FactoryGirl.create(:user) }
		let(:valid_session) { {"user_id" => user.id} }
		
		describe "GET new" do
			it "assigns all faculties as @faculties" do
			  faculty = Faculty.create! name: "Humanistinen tiedekunta"

			  get :new, {}, valid_session
			  assigns(:faculties).should eq([faculty])
			end
		end

	end
end
