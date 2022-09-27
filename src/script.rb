class Script
  def run_program
    puts 'Do you want to execute the interactive Checkout program? (Y/N)'
    exit if gets.chomp.strip.upcase == 'N'

    system('ruby interactive_checkout.rb')
  end
end

start = Script.new
start.run_program
