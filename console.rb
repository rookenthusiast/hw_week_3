require_relative( 'models/customer' )
require_relative( 'models/film' )
require_relative( 'models/ticket' )

require( 'pry-byebug' )

Ticket.delete_all()
Customer.delete_all()
Film.delete_all()

customer1 = Customer.new({'name' => 'Blobby Belly','funds' => 100})
customer2 = Customer.new({'name' => 'Danesh Threecansoflager', 'funds' => 30})
customer3 = Customer.new({'name' => 'Tracy Beaker', 'funds' => 2})
customer1.save()
customer2.save()
customer3.save()

film1 = Film.new({'title' => 'Saw', 'price' => 5})
film2 = Film.new({'title' => 'Angels Share', 'price' => 8})
film3 = Film.new({'title' => 'The Science Lab', 'price' => 10})
film1.save()
film2.save()
film3.save()

ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id })
ticket2 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film2.id })
ticket3 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film3.id })
ticket1.save()
ticket2.save()
ticket3.save()
# binding.pry
film1.price = (2)
film1.update_price()

binding.pry
nil