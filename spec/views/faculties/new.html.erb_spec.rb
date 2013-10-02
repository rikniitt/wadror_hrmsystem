require 'spec_helper'

describe "faculties/new" do
  before(:each) do
    assign(:faculty, stub_model(Faculty,
      :name => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new faculty form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", faculties_path, "post" do
      assert_select "input#faculty_name[name=?]", "faculty[name]"
      assert_select "textarea#faculty_description[name=?]", "faculty[description]"
    end
  end
end
