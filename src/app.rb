require_relative 'app/repositories/item_repository'
require_relative 'app/controllers/items_controller'

require_relative 'app/repositories/order_repository'
require_relative 'app/controllers/orders_controller'

require_relative 'app/repositories/user_repository'
require_relative 'app/controllers/users_controller'

require_relative 'app/controllers/sessions_controller'

require_relative 'router'

csv_file = File.join(__dir__, 'data/items.csv')
item_repository = ItemRepository.new(csv_file)
items_controller = ItemsController.new(item_repository)

# csv_file_customer = File.join(__dir__, 'data/customers.csv')
# customer_repository = CustomerRepository.new(csv_file_customer)

csv_file_user = File.join(__dir__, 'data/users.csv')
user_repository = UserRepository.new(csv_file_user)
users_controller = UserController.new(user_repository)
sessions_controller = SessionsController.new(user_repository)

csv_file_order = File.join(__dir__, 'data/orders.csv')
order_repository = OrderRepository.new(csv_file_order, item_repository, user_repository)
orders_controller = OrdersController.new(item_repository, user_repository, order_repository)

controllers = {
  sessions_controller: sessions_controller,
  users_controller: users_controller,
  items_controller: items_controller,
  orders_controller: orders_controller
}

router = Router.new(controllers)

router.run
