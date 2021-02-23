require 'io/console'

# Sessions View
class SessionsView

  def ask_for_username
    puts 'Username:'
    print '> '
    gets.chomp
  end

  def ask_for_password
    puts "\n"
    puts 'Password:'
    print '> '
    STDIN.noecho(&:gets).chomp
  end

  def display_wrong_credentials
    puts "Wrong credentials!\n Try again!"
    puts "\n"
  end
end
