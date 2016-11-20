

class Customer
  attr_accessor :name, :funds
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @funds = options['funds'].to_i
    @id = options['id'].to_i if options['id']
  end

  # def deduct_ticket(film_price)
  #   @funds -= film_price
  # end


  def save()
    sql = "INSERT INTO customers(name, funds) 
    VALUES ('#{@name}', '#{@funds}') RETURNING id"
    customer = SqlRunner.run(sql).first
    @id = customer['id'].to_i
  end

  def update_funds()
    sql = "UPDATE customers SET (funds = ('#{@funds}')
    WHERE id = #{@id};"
    funds = SqlRunner.run(sql)
    return funds.map { |person| Customer.new(person)}
  end

  def self.delete_all
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def self.all
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    result = customers.map { |person| Customer.new( person) }
    return result
  end

  def films()
    sql = "SELECT f.* FROM films f
    INNER JOIN tickets t
    ON f.id = t.film_id
    WHERE t.customer_id = #{@id};"
    films = Film.get_many(sql)
    return films
  end


end