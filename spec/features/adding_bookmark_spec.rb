feature 'Adding bookmarks' do
  scenario 'user can add a bookmark to their list' do
    con = PG.connect :dbname => 'bookmark_manager_test'

    con.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
    con.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
    con.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")

    visit '/bookmarks/add'
    fill_in 'url', with: 'http://www.facebook.com'
    click_button "Add Bookmark"

    expect(page).to have_content 'http://www.facebook.com'
  end
end
