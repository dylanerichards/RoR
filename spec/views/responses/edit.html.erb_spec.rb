require 'rails_helper'

RSpec.describe "responses/edit", type: :view do
  before(:each) do
    @response = assign(:response, Response.create!(
      :full_name => "MyString",
      :email => "MyString",
      :body => "MyText"
    ))
  end

  it "renders the edit response form" do
    render

    assert_select "form[action=?][method=?]", response_path(@response), "post" do

      assert_select "input#response_full_name[name=?]", "response[full_name]"

      assert_select "input#response_email[name=?]", "response[email]"

      assert_select "textarea#response_body[name=?]", "response[body]"
    end
  end
end
