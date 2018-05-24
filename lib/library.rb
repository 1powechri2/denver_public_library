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
end
