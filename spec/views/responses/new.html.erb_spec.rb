require 'rails_helper'

RSpec.describe "responses/new", type: :view do
  before(:each) do
    assign(:response, Response.new(
      :full_name => "MyString",
      :email => "MyString",
      :body => "MyText"
    ))
  end

  it "renders new response form" do
    render

    assert_select "form[action=?][method=?]", responses_path, "post" do

      assert_select "input#response_full_name[name=?]", "response[full_name]"

      assert_select "input#response_email[name=?]", "response[email]"

      assert_select "textarea#response_body[name=?]", "response[body]"
    end
  end
end
