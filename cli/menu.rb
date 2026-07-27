class Menu
  def run
    loop do
      print_options
      choice = gets.chomp

      case choice
      when "1"
        puts "You picked: View all books"
      when "2"
        add_book
      when "6"
        puts "Pce out!"
        break
      else
        puts "That doesn't mean anything"
      end
    end
  end

  private

  def print_options
    puts "What would you like to do?"
    puts "1. View all books"
    puts "2. Add new book"
    puts "3. View book's theme notes"
    puts "4. Update or edit a book"
    puts "5. Delete a book"
    puts "6. Exit"
    print ">"
  end

  def add_book
    puts "What book would you like to add?"

    print "Title: "
    title = gets.chomp

    print "Author: "
    author = gets.chomp

    print "Genres: "
    genres = gets.chomp

    print "Plot summary: "
    plot_summary = gets.chomp

    print "Page count: "
    page_count = gets.chomp.to_i

    book = Book.create(
      title: title,
      author: author,
      genres: genres,
      plot_summary: plot_summary,
      page_count: page_count
    )

    if book.persisted?
      puts "\n\"#{book.title}\" was added!"
    else
      puts "\nSomething went wrong: #{book.errors.full_messages.join(", ")}"
    end
  end
end