class Controller

  def initialize
    puts "Welcome to UNESCO World Heritage Sites!"
    Scraper.make_sites
  end

  def list_options(start_number)
    puts "---------- UNESCO Heritage Sites #{start_number} - #{start_number+99} ----------"
    Site.all[start_number-1, 100].each.with_index(start_number) do |site, i|
      puts "#{i}. #{site.title}"
    end
  end

  def call
    puts "What sites would you like to see? 1-100, 101-200, 201-300, ... 1001-1100"
    input = gets.strip.to_i
    list_options(input)
    puts "Type the site number you would like more info on or exit:"
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      if input.to_i > 0 && input.to_i <= Site.all.count
        site = Site.all[input.to_i - 1]
        puts ""
        puts "#{site.title}"
        puts ""
        puts "#{site.description}"
        puts ""
        puts "Type list to see the options again or exit."
      elsif input == "list"
        call
      else
        break if input == "exit"
        puts "Type a valid integer or exit."
      end
    end
    puts "Goodbye and happy learning!"
  end

end
