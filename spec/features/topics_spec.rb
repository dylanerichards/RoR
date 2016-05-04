describe "Topics" do
  feature "home page" do
    scenario 'displays list of topics' do
      visit "/"
      expect(page).to have_content "Topics"
    end

    scenario 'can be created' do
      expect {
        create_topic(name: "HTML", content: "foo")
      }.to change(Topic, :count).by 1

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

    feature "delete" do
      scenario "topic can be deleted from show page" do
        create_topic(name: "HTML", content: "foo")

        visit root_path
        click_on "HTML"

        expect {
          click_on "delete"
        }.to change(Topic, :count).by -1


      end

      feature "edit" do
        scenario "topic can be edited" do
          create_topic(name: "HTML", content: "foo")

          visit "/topics/1"

          click_on "edit"

          fill_in "Name", with: "New Name"

          click_on "Update Topic"

          expect(page).to have_content "New Name"
        end
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
