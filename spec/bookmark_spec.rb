require 'bookmarks'

describe Bookmarks do
  
  describe '.view_all' do
    it 'shows a list of bookmarks' do
      con = PG.connect :dbname => 'bookmark_manager_test' # connects to empty database table to use for testing purposes - Tests should always run against an empty database.

      #adds the test data
      con.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      con.exec("INSERT INTO bookmarks (url) VALUES ('http://www.destroyallsoftware.com');")
      con.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com');")

      bookmarks = Bookmarks.view_all
      expect(bookmarks).to include("http://www.google.com")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
      expect(bookmarks).to include("http://www.makersacademy.com")
    end
  end

  describe '.add' do
    it 'adds a bookmark' do
      Bookmarks.add(url: 'www.hello.com')
      expect(Bookmarks.view_all).to include('www.hello.com')
    end
  end
end
