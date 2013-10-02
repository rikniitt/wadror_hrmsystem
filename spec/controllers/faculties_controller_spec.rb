require 'spec_helper'

describe FacultiesController do


  let(:valid_attributes) { { "name" => "Humanistinen tiedekunta" } }
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all faculties as @faculties" do
      faculty = Faculty.create! valid_attributes
      get :index, {}, valid_session
      assigns(:faculties).should eq([faculty])
    end
  end

  describe "GET show" do
    it "assigns the requested faculty as @faculty" do
      faculty = Faculty.create! valid_attributes
      get :show, {:id => faculty.to_param}, valid_session
      assigns(:faculty).should eq(faculty)
    end
  end


  describe "when user is logged in" do

		let(:user) { FactoryGirl.create(:user) }
		let(:valid_session) { {"user_id" => user.id} }
		
		describe "GET new" do
			it "assigns a new faculty as @faculty" do
			  get :new, {}, valid_session
			  assigns(:faculty).should be_a_new(Faculty)
			end
		end

		describe "GET edit" do
			it "assigns the requested faculty as @faculty" do
			  faculty = Faculty.create! valid_attributes
			  get :edit, {:id => faculty.to_param}, valid_session
			  assigns(:faculty).should eq(faculty)
			end
		end

		describe "POST create" do
			describe "with valid params" do
			  it "creates a new Faculty" do
				expect {
				  post :create, {:faculty => valid_attributes}, valid_session
				}.to change(Faculty, :count).by(1)
			  end

			  it "assigns a newly created faculty as @faculty" do
				post :create, {:faculty => valid_attributes}, valid_session
				assigns(:faculty).should be_a(Faculty)
				assigns(:faculty).should be_persisted
			  end

			  it "redirects to the created faculty" do
				post :create, {:faculty => valid_attributes}, valid_session
				response.should redirect_to(Faculty.last)
			  end
			end

			describe "with invalid params" do
			  it "assigns a newly created but unsaved faculty as @faculty" do
				Faculty.any_instance.stub(:save).and_return(false)
				post :create, {:faculty => { "name" => "tooShort" }}, valid_session
				assigns(:faculty).should be_a_new(Faculty)
			  end

			  it "re-renders the 'new' template" do
				Faculty.any_instance.stub(:save).and_return(false)
				post :create, {:faculty => { "name" => "tooShort" }}, valid_session
				response.should render_template("new")
			  end
			end
		end

		describe "PUT update" do
			describe "with valid params" do
			  it "updates the requested faculty" do
				faculty = Faculty.create! valid_attributes
				Faculty.any_instance.should_receive(:update).with({ "name" => "MyString" })
				put :update, {:id => faculty.to_param, :faculty => { "name" => "MyString" }}, valid_session
			  end

			  it "assigns the requested faculty as @faculty" do
				faculty = Faculty.create! valid_attributes
				put :update, {:id => faculty.to_param, :faculty => valid_attributes}, valid_session
				assigns(:faculty).should eq(faculty)
			  end

			  it "redirects to the faculty" do
				faculty = Faculty.create! valid_attributes
				put :update, {:id => faculty.to_param, :faculty => valid_attributes}, valid_session
				response.should redirect_to(faculty)
			  end
			end

			describe "with invalid params" do
			  it "assigns the faculty as @faculty" do
				faculty = Faculty.create! valid_attributes
				Faculty.any_instance.stub(:save).and_return(false)
				put :update, {:id => faculty.to_param, :faculty => { "name" => "tooShort" }}, valid_session
				assigns(:faculty).should eq(faculty)
			  end

			  it "re-renders the 'edit' template" do
				faculty = Faculty.create! valid_attributes
				Faculty.any_instance.stub(:save).and_return(false)
				put :update, {:id => faculty.to_param, :faculty => { "name" => "tooShort" }}, valid_session
				response.should render_template("edit")
			  end
			end
		end

		describe "DELETE destroy" do
			it "destroys the requested faculty" do
			  faculty = Faculty.create! valid_attributes
			  expect {
				delete :destroy, {:id => faculty.to_param}, valid_session
			  }.to change(Faculty, :count).by(-1)
			end

			it "redirects to the faculties list" do
			  faculty = Faculty.create! valid_attributes
			  delete :destroy, {:id => faculty.to_param}, valid_session
			  response.should redirect_to(faculties_url)
			end
		end
	end

end
