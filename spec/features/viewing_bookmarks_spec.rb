require 'pg'

feature "Viewing bookmarks" do
  scenario "user can view a list of bookmarks" do

    Bookmarks.add(url: 'http://www.makersacademy.com')
    Bookmarks.add(url: 'http://www.destroyallsoftware.com')
    Bookmarks.add(url: 'http://www.google.com')
    
    visit '/'
    click_button "View Bookmarks"
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end
end
