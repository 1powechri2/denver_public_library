class Book
  def initialize(book)
    @book = book
  end

  def author_first_name
    @book[:author_first_name]
  end
end
