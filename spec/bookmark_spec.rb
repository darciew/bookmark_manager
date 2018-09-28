require 'bookmarks'

describe Bookmarks do

  describe '.view_all' do
    it 'shows a list of bookmarks' do
      con = PG.connect :dbname => 'bookmark_manager_test' # connects to empty database table to use for testing purposes - Tests should always run against an empty database.

      #adds the test data
      Bookmarks.add(url: 'http://www.makersacademy.com', title: 'Makers Academy')
      Bookmarks.add(url: 'http://www.destroyallsoftware.com', title: 'Destory All Software')
      Bookmarks.add(url: 'http://www.google.com', title: 'Google')

      bookmarks = Bookmarks.view_all
      bookmark = Bookmarks.view_all.first

      expect(bookmarks.length).to eq 3
      expect(bookmark).to be_a Bookmarks
      expect(bookmark).to respond_to(:id) # we do not check the value because the id can change
      expect(bookmark.title).to eq 'Makers Academy'
      expect(bookmark.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '.add' do
    it 'adds a bookmark' do
      bookmark = Bookmarks.add(url: 'http://www.hello.com', title: 'Test Bookmark')

      expect(bookmark).to be_a Bookmarks
      expect(bookmark).to respond_to(:id)
      expect(bookmark.title).to eq 'Test Bookmark'
    end

    it 'does not add bookmark if URL is invalid' do
      bookmark = Bookmarks.add(url: 'ww.yahoo.com', title: 'Yahoot')

      expect(bookmark).not_to be_a Bookmarks
    end
  end

end
