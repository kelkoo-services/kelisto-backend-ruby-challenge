# frozen_string_literal: true

class ViewItem
  def display(items)
    print `clear`
    greetings
    items.each_with_index do |item, index|
      puts "#{index + 1} - #{item.code} - #{item.name} (￡#{item.price})"
      puts "\n"
    end
    puts "\n"
  end

  def ask_for_element(element)
    puts "What is the #{element} of the item?"
    print '> '
    gets.chomp
  end

  def ask_for_index(element)
    puts "Which number do you want to #{element}?"
    print '> '
    gets.chomp.to_i - 1
  end

  def ask_for_element_new(element)
    puts "What is the new #{element} of the item?"
    print '> '
    gets.chomp
  end

  def no_edit
    puts "There's no item to edit"
  end

  def greetings
    puts '-------------------------------------------'
    puts ' 🍵🍓☕️       LIST OF ITEMS        ☕️🍓🍵'
    puts '-------------------------------------------'
    puts "\n"
  end

  def new_item
    print `clear`
    puts '-------------------------------------------'
    puts ' 🍵🍓☕️         NEW ITEM          ☕️🍓🍵'
    puts '-------------------------------------------'
    puts "\n"
  end
end
