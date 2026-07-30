# frozen_string_literal: true

puts "🌱 Seeding books..."

book1 = Book.find_or_create_by!(title: "East of Eden") do |book|
  book.author = "John Steinbeck"
  book.genres = "Literary Fiction"
  book.plot_summary = "Two families in California's Salinas Valley mirror the story of Cain and Abel across generations."
  book.page_count = 601
end

book2 = Book.find_or_create_by!(title: "The Witcher: The Last Wish") do |book|
  book.author = "Andrzej Sapkowski"
  book.genres = "Fantasy"
  book.plot_summary = "A monster hunter navigates a morally gray world of curses, kings, and creatures."
  book.page_count = 384
end

book3 = Book.find_or_create_by!(title: "The Lady of the Lake") do |book|
  book.author = "Andrzej Sapkowski"
  book.genres = "Fantasy"
  book.plot_summary = "The final volume of the Witcher saga, following a war-torn continent toward its reckoning."
  book.page_count = 512
end

book4 = Book.find_or_create_by!(title: "The Turn of the Screw") do |book|
  book.author = "Henry James"
  book.genres = "Horror, Mystery"
  book.plot_summary = "A governess grows convinced that ghosts are stalking the two children in her care."
  book.page_count = 128
end

book5 = Book.find_or_create_by!(title: "Project Hail Mary") do |book|
  book.author = "Andy Weir"
  book.genres = "Sci-fi"
  book.plot_summary = "A lone astronaut wakes with no memory, tasked with saving humanity from extinction. He meets a cute little guy a long the way."
  book.page_count = 496
end

book6 = Book.find_or_create_by!(title: "Wool") do |book|
  book.author = "Hugh Howey"
  book.genres = "Sci-fi"
  book.plot_summary = "The first book in the Silo series, set in an underground community sealed off from a ruined world above. We meet Julia, a mechanic, who is selected to replace the Mayor after he decides he wants to leave the silo, something that has never proved to be a successful endeavor in the history of the Silo."
  book.page_count = 509
end

book7 = Book.find_or_create_by!(title: "Y: The Last Man") do |book|
  book.author = "Brian K. Vaughan"
  book.genres = "Sci-fi", "Comic"
  book.plot_summary = "The only surviving man on Earth after a mysterious plague wipes out every other male mammal."
  book.page_count = 128
end

book8 = Book.find_or_create_by!(title: "Beartown") do |book|
  book.author = "Fredrik Backman"
  book.genres = "Literary Fiction"
  book.plot_summary = "A small town's hopes ride on its junior hockey team, until a single act shatters its unity."
  book.page_count = 432
end

book9 = Book.find_or_create_by!(title: "1984") do |book|
  book.author = "Jorjor Wel"
  book.genres = "Sci-fi, Literary Fiction"
  book.plot_summary = "A man living under a totalitarian surveillance state begins to question the Party's control over truth."
  book.page_count = 328
end

puts "✅ Done seeding!"