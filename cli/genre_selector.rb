class GenreSelector
  GENRES = ["Fantasy", "Sci-fi", "Mystery", "Horror", "Romance", "Lit-fic", "Non-fic", "Queer"]

  def self.choose
    puts "Add genres by associated number (e.g 1, 2, 3)".colorize(:yellow)
    GENRES.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre}"
    end
    puts "#{GENRES.length + 1}. Add custom genre"
    print ">"
    input = gets.chomp

    selections = input.split(",").map { |num| num.strip.to_i }

    chosen = []

    selections.each do |num|
      if num.between?(1, GENRES.length)
        chosen << GENRES[num - 1]
      elsif num == GENRES.length + 1
        print "Enter custom genre: "
        chosen << gets.chomp
      end
    end
    chosen.join(", ")
  end
end