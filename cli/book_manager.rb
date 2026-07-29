require "colorize"

class BookManager

  def success(message)
    puts message.colorize(:green)
  end

  def error(message)
    puts message.colorize(:red)
  end

  def warning(message)
    puts message.colorize(:yellow)
  end

  def label(text)
    puts text.colorize(:cyan)
  end
  # 1
  def view_all_books
    books = Book.all
    if books.empty?
      warning "No books yet."
    else
      success "Here they are: "
      books.each do |book|
        label "#{book.id}. #{book.title} by #{book.author}, #{book.page_count} pages"
      end
    end
  end

  # 2
  def add_book
    puts "What book would you like to add?"

    print "Title: "
    title = gets.chomp

    if Book.exists?(["LOWER(title) = ?", title.downcase])
      error "This book already exists"
      return
    end

    print "Author: "
    author = gets.chomp

    genres = GenreSelector.choose

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
      success "#{book.title} was added!"
      success "-" * 20
    else
      error "Something went wrong: #{book.errors.full_messages.join(", ")}"
    end
  end

  # 3 helper - finds the book by title (case-insensitive)
  def find_book_by_title(title)
    Book.find_by("LOWER(title) = ?", title.downcase)
  end

  # 3 helper 
  def print_book_details(book)
    label "#{book.title} by #{book.author}"
    label "Genres: #{book.genres} "
    label "Summary: #{book.plot_summary}"

    if book.theme_notes.empty?
      warning "No theme notes yet"
    else
      label "Theme notes: "
      book.theme_notes.each_with_index do |note, index|
        label "#{index + 1}. #{note.theme_name} page #{note.page_number}: #{note.description}:"
      end
    end
  end

  # 3.1
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
      success "Theme note added!"
      success "-" * 20
    else
      error "Something went wrong :/ sry "
    end
  end

  # 3.2
  def update_theme_note(book)
    print "Enter the theme note's number: "
    position = gets.chomp.to_i

    note = book.theme_notes[position - 1]

    if note.nil?
      warning "No theme note at that number for this book"
      return
    end

    print "Current theme name: #{note.theme_name}: "
    new_theme_name = gets.chomp
    note.theme_name = new_theme_name unless new_theme_name.empty?

    print "Current description: #{note.description}: "
    new_description = gets.chomp
    note.description = new_description unless new_description.empty?

    print "Current page number: #{note.page_number}: "
    new_page_number = gets.chomp
    note.page_number = new_page_number.to_i unless new_page_number.empty?

    if note.save
      success "Theme note updated successfully"
      success "-" * 20
    else
      error "Error occured updating note"
    end
  end

  # 3.3
  def delete_theme_note(book)
    print "Enter the theme note number for this book: "
    position = gets.chomp.to_i

    note = book.theme_notes[position - 1]

    if note.nil?
      warning "No note with that number"
      return
    end

    print "Are you sure you want to delete this? (y/n): "
    confirmation = gets.chomp.downcase

    if confirmation == "y"
      note.destroy
      success "Note deleted"
      success "-" * 20
    else
      warning "Deletion cancled"
    end
  end

  # 4
  def update_book
    print "Enter book ID: "
    id = gets.chomp.to_i

    book = Book.find_by(id: id)

    if book.nil?
      warning "No book listed with ID"
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
      success "Book updated!"
      success "-" * 20
    else
      error "Error updating #{book.errors.full_messages.join(", ")}"
    end
  end

  # 5
  def delete_book
    print "Enter book title: "
    title = gets.chomp

    book = Book.find_by(id: id)

    if book.nil?
      warning "No book listed under title"
      return
    end

    warning "Are you sure you wanna delete \"#{book.title}\" and its theme notes? (y/n): "
    confirm = gets.chomp.downcase

    if confirm == "y"
      book.destroy
      success "#{book.title} was deleted."
      success "-" * 20
    else
      warning "Cancled"
    end
  end
end