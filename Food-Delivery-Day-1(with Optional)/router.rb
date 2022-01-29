class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    puts '-' * 24
    puts 'Juicy Burger\'s POS System'
    puts '-' * 24

    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action) # rubocop:disable Metrics/MethodLength
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @meals_controller.remove
    when 4 then @customers_controller.list
    when 5 then @customers_controller.add
    when 6 then @customers_controller.remove
    when 7 then stop
    else
      puts 'Please press 1, 2, 3, 4, 5'
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    puts ''
    puts 'What do you want to do next?'
    puts '1 - List all meals'
    puts '2 - Create a new meal'
    puts '3 - Delete a meal'
    puts '4 - List all customers'
    puts '5 - Create a new customer'
    puts '6 - Delete a customer'
    puts '7 - Stop and exit the program'
  end
end
