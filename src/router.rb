class Router
  def initialize(controllers = {})
    @items_controller = controllers[:items_controller]
    # @customers_controller = controllers[:customers_controller]
    @sessions_controller = controllers[:sessions_controller]
    # @orders_controller = controllers[:orders_controller]
    @running = true
    @user = nil
  end

  def run

    while @running
      print `clear`
      welcome
      @user = @sessions_controller.create

      while @user
        print `clear`
        welcome
        greetings
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
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @meals_controller.delete
    when 4 then @meals_controller.edit
    when 5 then @customers_controller.list
    when 6 then @customers_controller.add
    when 7 then @customers_controller.delete
    when 8 then @customers_controller.edit
    when 9 then @orders_controller.add
    when 10 then @orders_controller.list_undelivered_orders
    when 0 then destroy_session
    else
      puts 'Please press any of the displayed numbers'
    end
  end

  def route_client_action(action)
    case action
    when 1 then @orders_controller.new_order(@user)
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
    puts '1 - Create new item'
    puts '2 - Edit item'
    puts '3 - Delete item'
    puts '4 - Create new offer'
    puts '5 - Edit offer'
    puts '6 - Delete offer'
    puts '7 - See all orders'
    puts '8 - Create new client'
    puts '9 - Edit client'
    puts '10 - Delete client'
    puts '0 - Log out'
    puts "\n"
  end

  def display_client_tasks
    puts "\n"
    puts '1 - Create new order'
    puts '2 - View past orders'
    puts '0 - Stop and exit the program'
    puts "\n"
  end

  def welcome
    puts '-------------------------------------------'
    puts ' 🥑🍅🍖🍟        Welcome        🍟🍖🍅🥑'
    puts '-------------------------------------------'
    puts "\n"
  end

  def goodbye
    puts '-------------------------------------------'
    puts ' 🥑🍅🍖🍟        Goodbye!       🍟🍖🍅🥑'
    puts '-------------------------------------------'
    puts "\n"
    stop
  end

  def greetings
    puts "\n"
    puts '------ 🍻🍴🍽 SHOP OPTIONS 🍽🍴🍻 ------'
    puts "\n"
    puts 'What do you want to do next?'
    puts "\n"
  end
end
