feature 'Adding bookmarks' do
  scenario 'user can add a bookmark to their list' do
    connect_test_database
    visit '/bookmarks/add'
    fill_in 'url', with: 'http://www.facebook.com'
    fill_in 'title', with: 'Facebook'
    click_button "Add Bookmark"

    expect(page).to have_link('Facebook', href: 'http://www.facebook.com')
  end

  scenario 'user add an incorrect URL' do
    connect_test_database
    visit '/bookmarks/add'
    fill_in 'url', with: 'ww.yahoo.com'
    click_button "Add Bookmark"

    expect(page).not_to have_content 'ww.yahoo.com'
    expect(page).to have_content 'URL not valid'
  end

end
