feature "navbar" do
  scenario "contains brand link" do
    visit "/"

    within ".navbar-brand" do
      expect(page).to have_content "RoR"
    end
  end

  scenario "brand link goes home" do
    visit "/topics"

    click_on "RoR"

    expect(current_path).to eq "/"
  end
end
