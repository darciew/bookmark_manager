def connect_test_database
  con = PG.connect :dbname => 'bookmark_manager_test'

  con.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
  con.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
  con.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")
end 
