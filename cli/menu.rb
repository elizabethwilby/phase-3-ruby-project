class Menu
  def initialize
    @manager = BookManager.new
  end

  def run
    loop do
      print_options
      choice = gets.chomp

      case choice
      when "1"
        @manager.view_all_books
      when "2"
        @manager.add_book
      when "3"
        view_book
      when "4"
        @manager.update_book
      when "5"
        @manager.delete_book
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
    puts "Welcome to BookLove!"
    puts "What would you like to do?"
    puts "1. View all books"
    puts "2. Add new book"
    puts "3. View a book"
    puts "4. Update or edit a book"
    puts "5. Delete a book"
    puts "6. Exit"
    print ">"
  end

  # 3 - navigation shell, calls out to BookManager for the database work
  def view_book
    print "Enter book title: "
    title = gets.chomp

    book = @manager.find_book_by_title(title)

    if book.nil?
      puts "No book with this title."
      return
    end

    loop do
      @manager.print_book_details(book)
    
      puts "What would you like to do?"
      puts "1. Add theme note"
      puts "2. Update theme note"
      puts "3. Delete theme note"
      puts "4. Back to main menu"
      print ">"
      sub_choice = gets.chomp

      case sub_choice
      when "1"
        @manager.add_theme_note(book)
      when "2"
        @manager.update_theme_note(book)
      when "3"
        @manager.delete_theme_note(book)
      when "4"
        break
      end
    end
  end
end