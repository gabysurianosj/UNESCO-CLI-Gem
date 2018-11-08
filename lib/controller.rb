class Controller

  def initialize
    puts "\nWelcome to UNESCO World Heritage Sites!".light_blue
    puts "-------------------------------------------"
    Scraper.make_sites
  end

  def list_options(start_number)
    puts "\n---------- UNESCO Heritage Sites #{start_number} - #{start_number+99} ----------".light_blue
    Site.all[start_number-1, 100].each.with_index(start_number) do |site, i|
      puts "#{i}. #{site.title}"
    end
  end

  def call
    puts "\nWhat sites would you like to see?".cyan
    puts "\n1-100, 101-200, 201-300,..., 1001-1100 - choose a category:".cyan
    input = gets.strip.to_i
    list_options(input)
    puts "\nType the 'site number' you would like more information on, or 'exit':".cyan
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      if input.to_i > 0 && input.to_i <= Site.all.count
        site = Site.all[input.to_i - 1]
        puts ""
        puts "\n#{site.title}".light_blue
        puts ""
        puts "#{site.description}"
        puts ""
        puts "\nType 'list' to see the options again or 'exit'.".cyan
      elsif input == "list"
        call
      else
        break if input == "exit"
        puts "\nType a valid integer or exit.".red
      end
    end
    puts "\nThank you for the visit! Knowledge is power, stay curious!".green
  end

end
