# frozen_string_literal: true

class ViewUser
  def display(users)
    print `clear`
    list_users
    users.each do |user|
      if user.id == 1
      else
        puts "#{user.id} - User: #{user.username} Password: ******"
      end
    end
    puts "\n"
  end

  def ask_for_element(element)
    puts "What is the #{element} of the new customer?"
    print '> '
    gets.chomp
  end

  def ask_for_index(element)
    puts "Which number do you want to #{element}?"
    print '> '
    gets.chomp.to_i - 1
  end

  def ask_for_element_new(element)
    puts "What is the new #{element} of the customer?"
    print '> '
    gets.chomp
  end

  def list_users
    puts '-------------------------------------------'
    puts ' 🍵🍓☕️       LIST OF USERS        ☕️🍓🍵'
    puts '-------------------------------------------'
    puts "\n"
  end
end
