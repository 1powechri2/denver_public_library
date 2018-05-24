require './test/test_helper'
require './lib/author'

class AuthorTest < Minitest::Test
  def setup
    @charlotte_bronte = Author.new({first_name: "Charlotte",\
                                   last_name: "Bronte"})
  end

  def test_author_exits
    assert_instance_of Author, @charlotte_bronte
  end

  def test_author_has_no_books
    assert_equal [], @charlotte_bronte.books
  end

   def test_add_book
     book = @charlotte_bronte.add_book("Jane Eyre", "1847")
     assert_equal book, @charlotte_bronte.books[0]
   end

   def test_add_multiple_books
     book_1 = @charlotte_bronte.add_book("Jane Eyre", "1847")
     book_2 = @charlotte_bronte.add_book("Villette", "1853")

     assert_equal book_1, @charlotte_bronte.books[0]
     assert_equal book_2, @charlotte_bronte.books[1]

   end
end
