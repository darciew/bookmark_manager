require 'pg'

feature "Viewing bookmarks" do
  scenario "user can view a list of bookmarks" do

    Bookmarks.add(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    Bookmarks.add(url: 'http://www.destroyallsoftware.com', title: 'Destory All Software')
    Bookmarks.add(url: 'http://www.google.com', title: 'Google')

    visit '/'
    click_button "View Bookmarks"
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Destory All Software', href: 'http://www.destroyallsoftware.com')
    expect(page).to have_link('Google', href: 'http://www.google.com')
  end
end
