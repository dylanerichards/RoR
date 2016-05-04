describe "Topics" do
  feature "home page" do
    scenario 'displays list of topics' do
      visit "/"
      expect(page).to have_content "Topics"
    end

    scenario 'can be created' do
      create_topic(name: "HTML", content: "foo")
      visit "/"

      expect(page).to have_content "HTML"
    end

    feature "show page" do
      scenario 'shows an individual topic' do
        create_topic(name: "HTML", content: "foo")
        visit "/"

        click_on "HTML"

        expect(page).to have_content "HTML"
        expect(page).to have_content "foo"
      end
    end

    private

    def create_topic(args = {})
      visit "/topics/new"

      expect(page).to have_content "New Topic"

      fill_in "Name", with: args[:name]
      fill_in "Content", with: args[:content]

      click_on "Create Topic"
    end
  end
end
