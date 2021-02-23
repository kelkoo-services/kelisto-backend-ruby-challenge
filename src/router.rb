# frozen_string_literal: true

class Router
  def initialize(controllers = {})
    @items_controller = controllers[:items_controller]
    @users_controller = controllers[:users_controller]
    @sessions_controller = controllers[:sessions_controller]
    @orders_controller = controllers[:orders_controller]
    @running = true
    @user = nil
  end

  def run
    while @running
      print `clear`
      welcome
      @user = @sessions_controller.create

      while @user
        @user.admin? ? display_admin_tasks : display_client_tasks
        action = gets.chomp.to_i
        print `clear`
        @user.admin? ? route_admin_action(action) : route_client_action(action)
      end
    end
  end

  private

  def route_admin_action(action)
    case action
    when 1 then @items_controller.add
    when 2 then @items_controller.edit
    when 3 then @items_controller.delete
    when 4 then @orders_controller.list
    when 5 then @users_controller.add
    when 6 then @users_controller.edit
    when 7 then @users_controller.delete
    when 0 then destroy_session
    else
      puts 'Please press any of the displayed numbers'
    end
  end

  def route_client_action(action)
    case action
    when 1 then @orders_controller.add(@user)
    when 2 then @orders_controller.list_my_orders(@user)
    when 0 then goodbye
    else
      puts 'Please press any of the displayed numbers'
    end
  end

  def destroy_session
    @user = nil
  end

  def stop
    destroy_session
    @running = false
  end

  def display_admin_tasks
    greetings_admin
    puts '1 - Create new item'
    puts '2 - Edit item'
    puts '3 - Delete item'
    puts '4 - See all orders'
    puts '5 - Create new client'
    puts '6 - Edit client'
    puts '7 - Delete client'
    puts '0 - Log out'
    puts "\n"
  end

  def display_client_tasks
    greetings
    puts '1 - Create new order'
    puts '2 - View past orders'
    puts '0 - Stop and exit the program'
    puts "\n"
  end

  def welcome
    puts '-------------------------------------------'
    puts ' 🍵🍓☕️          Welcome          ☕️🍓🍵'
    puts '-------------------------------------------'
    puts "\n"
  end

  def goodbye
    puts '-------------------------------------------'
    puts ' 🍵🍓☕️          Goodbye!         ☕️🍓🍵'
    puts '-------------------------------------------'
    puts "\n"
    stop
  end

  def greetings
    puts "\n"
    puts '-------------------------------------------'
    puts ' 🍵🍓☕️            SHOP           ☕️🍓🍵'
    puts '-------------------------------------------'
    puts "\n"
    puts 'What do you want to do next?'
    puts "\n"
  end

  def greetings_admin
    puts "\n"
    puts '-------------------------------------------'
    puts ' 🍵🍓☕️       CONTROL PANEL       ☕️🍓🍵'
    puts '-------------------------------------------'
    puts "\n"
    puts 'What do you want to do next?'
    puts "\n"
  end
end
