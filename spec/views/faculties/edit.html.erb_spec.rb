require 'spec_helper'

describe "faculties/edit" do
  before(:each) do
    @faculty = assign(:faculty, stub_model(Faculty,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit faculty form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", faculty_path(@faculty), "post" do
      assert_select "input#faculty_name[name=?]", "faculty[name]"
      assert_select "textarea#faculty_description[name=?]", "faculty[description]"
    end
  end
end
