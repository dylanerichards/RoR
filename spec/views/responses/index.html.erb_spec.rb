require 'rails_helper'

RSpec.describe "responses/index", type: :view do
  before(:each) do
    assign(:responses, [
      Response.create!(
        :full_name => "Full Name",
        :email => "Email",
        :body => "MyText"
      ),
      Response.create!(
        :full_name => "Full Name",
        :email => "Email",
        :body => "MyText"
      )
    ])
  end

  it "renders a list of responses" do
    render
    assert_select "tr>td", :text => "Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
