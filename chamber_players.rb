require 'bundler/setup'
Bundler.require(:default)
I18n.enforce_available_locales = false

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))['development'])

@current_composer = nil
@current_piece = nil

def welcome
  system('clear')
  puts "*" * 27
  puts "Welcome to Chamber Players!"
  puts "*" * 27
  main_menu
end

def main_menu
  puts "\nPlease select from the following choices:"
  puts "[c] to add a new chamber piece"
  puts "[p] to list and add parts of a piece"
  puts "[m] to add a new musician"
  puts "[x] to exit"

  choice = gets.chomp
  case choice
  when 'c'
    add_piece
  when 'p'
    parts
  when 'm'
    add_musician
  when 'x'
    puts "\nUntil next time!"
    exit
  else
    puts "\nInvalid option, please try again."
    main_menu
  end
end

def add_piece
  puts "\nPlease enter the composer of the piece:"
  composer = gets.chomp
  new_composer = Composer.find_or_create_by(name: composer)

  puts "\nPlease enter the title of the piece:"
  title = gets.chomp

  puts "\nPlease enter the number of parts for this piece:"
  number_of_parts = gets.chomp

  new_piece = Piece.create(title: title, composer_id: new_composer.id, number_of_parts: number_of_parts)

  if new_piece.save && new_composer.save
    puts "\n#{new_piece.title} by #{new_composer.name} has been added to the music library."
    puts "\nWould you like to enter a new piece? y/n"
    choice = gets.chomp
    case choice
    when 'y'
      add_piece
    when 'n'
      puts "\nReturning to the main menu..."
      main_menu
    else
      puts "\nInvalid entry, returning to the main menu."
      main_menu
    end
  else
    puts "\nSorry, that wasn't a valid entry. Please try again."
    if !new_piece.save || !new_composer.save
      new_piece.errors.full_messages.each { |message| puts message }
      new_composer.errors.full_messages.each { |message| puts message }
    end
    add_piece
  end
end

def parts
  if Composer.all.length == 0
    puts "Looks like your music library is empty. Please enter some chamber pieces to get started."
    main_menu
  else
    puts "\nHere are all the composers we have on file:"
    Composer.all.each_with_index do |composer, index|
      puts "#{index+1}. #{composer.name}"
    end

    puts "\nPlease select the number of a composer to list out their pieces,"
    puts "or press any other key to return to the main menu"
    choice = gets.chomp
    if choice.to_i == 0
      puts "\nReturning to main menu..."
      main_menu
    else
      @current_composer = Composer.all.fetch((choice.to_i)-1) do |composer|
        puts "\nInvalid entry, please try again"
        parts
      end
    end

    puts "\nHere are all of our pieces composed by #{@current_composer.name}:"
    results = Piece.find_by_composer(@current_composer)
    results.each_with_index do |piece, index|
      puts "#{index+1}. #{piece.title} -- #{piece.number_of_parts} parts."
    end

    puts "\nWhich one would you like to access? Please enter the appropriate number, or [x] to return to the main menu."
    choice = gets.chomp

    if choice == 'x'
      puts "\nReturning to the main menu..."
      main_menu
    elsif choice.to_i == 0
      puts "\nInvalid entry, please try again."
      parts
    else
      @current_piece = @current_composer.pieces.fetch((choice.to_i)-1) do |piece|
        puts "\n#{choice} isn't a valid option, please try again."
      end
    end
    list_parts
  end
end

def list_parts
  if @current_piece.parts.length == 0
    puts "\nLooks like there are no parts listed for this piece yet. Let's add some!"
    add_parts
  else @current_piece.parts.length > 0
    puts "\nHere are the parts listed for #{@current_piece.title}:"
    @current_piece.parts.each_with_index do |part, index|
      puts "#{index+1}. #{part.instrument}"
    end

    puts "\nPress the number of the part to assign it to a specific musician, or press"
    puts "[a] to add a part to this piece, or"
    puts "[x] to return to the main menu"

    choice = gets.chomp
    case choice
    when 'a'
      parts_are_you_sure
    when 'x'
      main_menu
    else
      @current_part = Part.all.fetch((choice.to_i)-1) do |part|
        puts "\nInvalid entry, please try again."
        list_parts
      end
      #assign part to musician here
    end
  end
end

def parts_are_you_sure
   puts "\nWould you like to add a new part to #{@current_piece.title} by #{@current_composer.name}? y/n"
  choice = gets.chomp

  case choice
  when 'n'
    puts "\nNo worries. Returning to the main menu..."
    main_menu
  when 'y'
    add_parts
  else
    puts "\nInvalid entry, please try again."
    add_parts
  end
end

def add_parts
  if @current_piece.number_of_parts.to_i == @current_piece.parts.length
    puts "\nLooks like the instrumentation for this piece is full. Please select another piece."
    parts
  else
    puts "\nWhat instrumentation would you like to add?"
    instrument = gets.chomp

    new_part = Part.create(instrument: instrument, piece_id: @current_piece.id)

    if new_part.save
      puts "\nA #{new_part.instrument} part has been added the piece #{@current_piece.title}."
      puts "\nWould you like to add another part? y/n"

      choice = gets.chomp
      case choice
      when 'y'
        if @current_piece.number_of_parts.to_i == @current_piece.parts.length
          puts "\nLooks like the instrumentation for this piece is full. Please select another piece."
          parts
        else
          add_parts
        end
      when 'n'
        puts "\nReturning to the last menu..."
        list_parts
      else
        puts "\nInvalid entry, please try again."
        add_parts
      end
    else
      puts "\nSorry, that wasn't a valid entry. Please try again."
      if !new_part.save
        new_part.errors.full_messages.each { |message| puts message }
      end
      add_parts
    end
  end
end

def add_musician
  puts "\nPlease enter the name of the musician:"
  name = gets.chomp

  puts "\nPlease enter this musician's main instrument:"
  instrument = gets.chomp

  new_musician = Musician.create(name: name, instrument: instrument)

  if new_musician.save
    puts "\n#{new_musician.name} (#{new_musician.instrument} player) has been added to the personnel list."
    puts "\nWould you like to enter a new musician? y/n"
    choice = gets.chomp
    case choice
    when 'y'
      add_musician
    when 'n'
      puts "\nReturning to the main menu..."
      main_menu
    else
      puts "\nInvalid entry, returning to the main menu."
      main_menu
    end
  else
    puts "\nSorry, that wasn't a valid entry. Please try again."
    new_piece.errors.full_messages.each { |message| puts message }
    add_musician
  end
end

welcome
