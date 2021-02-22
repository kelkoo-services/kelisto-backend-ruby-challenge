class ViewItem
  def display(items)
    items.each_with_index do |item, index|
      puts "#{index + 1} - #{item.name} - #{item.code} (￡#{item.price})"
    end
  end

  def ask_for_element(element)
    puts "What is the #{element} of the meal?"
    print "> "
    gets.chomp
  end

  def ask_for_index(element)
    puts "Which number do you want to #{element}?"
    print "> "
    gets.chomp.to_i - 1
  end

  def ask_for_element_new(element)
    puts "What is the new #{element} of the meal?"
    print "> "
    gets.chomp
  end

  def greetings
    puts "--------------------------------------------"
    puts "\n"
    puts "  🍟🍖🍅🥑  👉 List of Items 👈  🍟🍖🍅🥑"
    puts "\n"
    puts "--------------------------------------------"
    puts "\n"
  end
end
