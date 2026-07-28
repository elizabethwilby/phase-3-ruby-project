class Menu
  def run
    loop do
      print_options
      choice = gets.chomp

      case choice
      when "1"
        view_all_books
      when "2"
        add_book
      when "3"
        view_book
      when "4"
        update_book
      when "5"
        delete_book
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
    puts "3. View a book"
    puts "4. Update or edit a book"
    puts "5. Delete a book"
    puts "6. Exit"
    print ">"
  end
# 1
  def view_all_books
    books = Book.all
    if books.empty?
      puts "No books yet."
    else
      puts "Here they are: "
      books.each do |book|
        puts "#{book.id}. #{book.title} by #{book.author}, #{book.page_count} pages"
      end
    end
  end
# 2
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
      puts "#{book.title} was added!"
      puts "-" * 20
      puts "-" * 20
    else
      puts "Something went wrong: #{book.errors.full_messages.join(", ")}"
    end
  end
# 3
  def view_book
    print "Enter book ID: "
    id = gets.chomp.to_i

    book = Book.find_by(id: id)

    if book.nil?
      puts "No book with this ID."
      return
    end

    loop do
      puts "#{book.title} by #{book.author}"
      puts "#{book.plot_summary}"

      if book.theme_notes.empty?
        puts "No theme notes yet"
      else 
        puts "Theme notes: "
        book.theme_notes.each do |note|
          puts "#{note.id}. #{note.theme_name} page #{note.page_number}: #{note.description}:"
        end
      end

      puts "What would you like to do?"
      puts "1. Add theme note"
      puts "2. Update theme note"
      puts "3. Delete theme note"
      puts "4. Back to main menu"
      print ">"
      sub_choice = gets.chomp

      case sub_choice
      when "1"
        add_theme_note(book)
      when "2"
        update_theme_note(book)
      when "3"
        delete_theme_note(book)
      when "4"
        break
      end
    end
  end

  def add_theme_note(book)
    print "Theme name: "
    theme_name = gets.chomp

    print "Description: "
    description = gets.chomp

    print "Page number: "
    page_number = gets.chomp.to_i

    note = book.theme_notes.create(
      theme_name: theme_name,
      description: description, 
      page_number: page_number
    )

    if note.persisted?
      puts "Theme note added!"
      puts "-" * 20
      puts "-" * 20

    else
      puts "Something went wrong :/ sry "
    end
  end

  def update_theme_note(book)
    print "Enter the theme note's ID: "
    note_id = gets.chomp.to_i

    note = book.theme_notes.find_by(id: note_id)

    if note.nil?
      puts "No theme note with that ID for this book"
      return
    end

    print "Current theme name: #{note.theme_name}: "
    new_theme_name = gets.chomp
    note.theme_name = new_theme_name unless new_theme_name.empty? 

    print "Current description: #{note.description}: "
    new_description = gets.chomp
    note.description = new_description

    print "Current page number: #{note.page_number}: "
    new_page_number = gets.chomp
    note.page_number = new_page_number.to_i unless new_page_number.empty?

    if note.save
      puts "Theme note updated successfully"
      puts "-" * 20
      puts "-" * 20
    else 
      puts "Error occured updating note"
      puts "-" * 20
    end
  end

  def delete_theme_note(book)
    print "Enter the theme note ID: "
    note_id = gets.chomp.to_i

    note = book.theme_notes.find_by(id: note_id)

    if note.nil?
      puts "No theme note with that ID for this book"
      return
    end

      print "Are you sure you want to delete this? (y/n): "
      confirmation = gets.chomp.downcase

      if confirmation == "y"
        note.destroy
        puts "Note deleted"
        puts "-" * 20
        puts "-" * 20
      else
        puts "Deletion cancled"
      end
    end


    # 4
  def update_book
    print "Enter book ID: "
    id =gets.chomp.to_i

    book = Book.find_by(id: id)

    if book.nil?
      puts "No book listed with ID"
      return
    end

    print "Current title: #{book.title}: "
    new_title = gets.chomp
    book.title = new_title unless new_title.empty?

    print "Current author: #{book.author}: "
    new_author = gets.chomp
    book.author = new_author unless new_author.empty?

    print "Current genres: #{book.genres}: "
    new_genres = gets.chomp
    book.genres = new_genres unless new_genres.empty?

    print "Current summary: #{book.plot_summary}: "
    new_summary = gets.chomp
    book.plot_summary = new_summary unless new_summary.empty?

    print "Current page count: #{book.page_count}: "
    new_page_count = gets.chomp
    book.page_count = new_page_count.to_i unless new_page_count.empty?

    if book.save
      puts "Book updated!"
      puts "-" * 20
      puts "-" * 20
    else
      puts "Error updating #{book.errors.full_messages.join(", ")}"
      puts "-" * 20
    end
  end
  # 5
  def delete_book
    print "Enter book ID: "
    id = gets.chomp.to_i

    book = Book.find_by(id: id)

    if book.nil?
      puts "No book listed under ID"
      return
    end

    print "Are you you wanna delete \"#{book.title}\" and its theme notes? \"(y/n)\""
    confirm = gets.chomp.downcase

    if confirm == "y"
      book.destroy
      puts "#{book.title} was deleted."
      puts "-" * 20
      puts "-" * 20
    else
      puts "Cancled"
    end
  end
end