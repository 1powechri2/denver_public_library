require './test/test_helper'
require './lib/library'
require './lib/author'

class LibraryTest < Minitest::Test
  def setup
    @dpl = Library.new
    charlotte_bronte = Author.new({first_name: "Charlotte",\
                                    last_name: "Bronte"})
    @jane_eyre = charlotte_bronte.add_book("Jane Eyre",\
                                            "October 16, 1847")
    @villette  = charlotte_bronte.add_book("Villette", "1853")
    harper_lee = Author.new({first_name: "Harper",\
                              last_name: "Lee"})
    @mockingbird = harper_lee.add_book("To Kill a Mockingbird",\
                                       "July 11, 1960")
  end

  def test_library_exists
    assert_instance_of Library, @dpl
  end

  def test_library_has_no_books
    assert_equal [], @dpl.books
  end

  def test_add_to_collection
    book = @dpl.add_to_collection(@jane_eyre)

    assert_equal book, @dpl.books[0]
  end

  def test_add_multiple_books
    book_1 = @dpl.add_to_collection(@jane_eyre)
    book_2 = @dpl.add_to_collection(@mockingbird)
    book_3 = @dpl.add_to_collection(@villette)

    assert_equal book_1, @dpl.books[0]
    assert_equal book_2, @dpl.books[1]
    assert_equal book_3, @dpl.books[2]
  end

  def test_has_a_book
    book_1 = @dpl.add_to_collection(@jane_eyre)
    book_2 = @dpl.add_to_collection(@mockingbird)
    book_3 = @dpl.add_to_collection(@villette)

    assert @dpl.include?("To Kill a Mockingbird")
    refute @dpl.include?("A Connecticut Yankee in King Arthur's Court")
  end

  def test_card_catalogue
    book_1 = @dpl.add_to_collection(@jane_eyre)
    book_2 = @dpl.add_to_collection(@mockingbird)
    book_3 = @dpl.add_to_collection(@villette)

    assert_equal "Bronte", @dpl.card_catalogue[0].author_last_name
    assert_equal "Bronte", @dpl.card_catalogue[1].author_last_name
    assert_equal "Lee", @dpl.card_catalogue[2].author_last_name
  end
end
