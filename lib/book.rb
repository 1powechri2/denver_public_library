class Book
  def initialize(book)
    @book = book
  end

  def author_first_name
    @book[:author_first_name]
  end

  def author_last_name
    @book[:author_last_name]
  end

  def title
    @book[:title]
  end

  def publication_date
    @book[:publication_date][-4..-1]
  end
end
