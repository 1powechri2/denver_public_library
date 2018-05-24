class Library
  attr_reader :books

  def initialize
    @books = []
  end

  def add_to_collection(book)
    @books << book
    return book
  end

  def include?(title)
    @books.one? do |book|
      book.title == title
    end
  end

  def card_catalogue
    @books.sort_by do |book|
      book.author_last_name
    end
  end

  def find_by_author(author)
    last_name = author.split(' ')[1]
    bookers = Hash.new
    @books.each do |book|
      if book.author_last_name == last_name
        bookers[book.title] = book
      end
    end
    bookers
  end
end
