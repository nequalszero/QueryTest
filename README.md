## Directions
1. Run `bundle install`.
2. Run `rake db:setup`
3. Enter `rails c`
4. Inside rails console, call `Transfer.find_transactions_adding_to_minimum(amount)` to get all users that have at most 3 transactions adding up to a minimum of the requested amount.
