require_relative('../db/sql_runner')
require_relative('customer.rb')
require_relative('film.rb')
class Ticket

attr_reader :id 
attr_accessor :customer_id, :film_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets(customer_id, film_id) 
    VALUES ('#{@customer_id}', '#{@film_id}') RETURNING id"
    tickets = SqlRunner.run( sql ).first
    @id = tickets['id'].to_i
  end


  def self.delete_all
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM tickets"
    tickets = SqlRunner.run(sql)
    result = tickets.map { |ticket| Ticket.new( ticket) }
    return result
  end

    def customer()
  sql = "SELECT * FROM customers WHERE id = #{@customer_id}"
  customer = SqlRunner.run(sql).first
  return Customer.new(customer)
    end

      def film()
    sql = "SELECT * FROM films WHERE id = #{@film_id}"
    film_hash = SqlRunner.run(sql).first
    return Film.new(film_hash)
      end
end