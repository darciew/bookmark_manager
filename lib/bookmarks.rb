require 'pg'
require 'uri'

class Bookmarks

  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.view_all
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end
    result = con.exec("SELECT * FROM bookmarks")
    result.map do |bookmark|
      Bookmarks.new(
        id: bookmark['id'],
        title: bookmark['title'],
        url: bookmark['url']
      )
    end
  end

  def self.add(url:, title:)
    return false unless valid_url?(url)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end
    result = con.exec("INSERT INTO bookmarks (title, url) VALUES('#{title}', '#{url}') RETURNING id, title, url;")
    Bookmarks.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  private

  def self.valid_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end

end
