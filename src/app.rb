require_relative 'app/repositories/item_repository'
require_relative 'app/controllers/items_controller'

# require_relative 'app/repositories/customer_repository'
# require_relative 'app/controllers/customers_controller'

# require_relative 'app/repositories/order_repository'
# require_relative 'app/controllers/orders_controller'

require_relative 'app/repositories/user_repository'
require_relative 'app/controllers/sessions_controller'

require_relative 'router'

csv_file = File.join(__dir__, 'data/items.csv')
item_repository = ItemRepository.new(csv_file)
items_controller = ItemsController.new(item_repository)

# csv_file_customer = File.join(__dir__, 'data/customers.csv')
# customer_repository = CustomerRepository.new(csv_file_customer)
# customers_controller = CustomersController.new(customer_repository)

csv_file_user = File.join(__dir__, 'data/users.csv')
user_repository = UserRepository.new(csv_file_user)
sessions_controller = SessionsController.new(user_repository)

# csv_file_order = File.join(__dir__, 'data/orders.csv')
# order_repository = OrderRepository.new(csv_file_order, meal_repository, customer_repository, employee_repository)
# orders_controller = OrdersController.new(meal_repository, customer_repository, employee_repository, order_repository)

controllers = {
  sessions_controller: sessions_controller,
  # customers_controller: customers_controller,
  items_controller: items_controller
  # orders_controller: orders_controller
}

router = Router.new(controllers)

router.run
