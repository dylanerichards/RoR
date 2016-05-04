feature "Topics" do
  scenario 'are on the home page' do
    visit "/"
    expect(page).to have_content "Topics"
  end

  scenario 'can be created' do
    visit "/topics/new"

    fill_in "Name", with: "HTML"
    fill_in "Content", with: "foo"

    click_on "Create Topic"

    visit "/"
    expect(page).to have_content "HTML"
  end
end
