require_relative('../db/sql_runner')

class Film

attr_accessor :title, :price
attr_reader :id

  def initialize(options)
    @title = options['title']
    @price = options['price'].to_i
    @id = options['id'].to_i if options['id']
  end


  def save()
    sql = "INSERT INTO films(title, price) 
    VALUES ('#{@title}', '#{@price}') RETURNING id"
    films = SqlRunner.run(sql).first
    @id = films['id'].to_i
  end

  def update_price()
    sql = "UPDATE films SET (price) = ('#{@price}')
    WHERE id = #{@id};"
    films = SqlRunner.run(sql)
    return films.map { |movie| Film.new(movie)}
  end

  def customers()
    sql = "SELECT c.* FROM customers c
    INNER JOIN tickets t
    ON c.id = t.customer_id
    WHERE t.film_id = #{@id};"
    films = Film.get_many(sql)
    return films
  end

  def self.delete_all
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end


  def self.all
    sql = "SELECT * FROM films"
    films = SqlRunner.run(sql)
    result = films.map { |movie| Film.new( movie) }
    return result
  end

   def self.get_many(sql)
     films = SqlRunner.run(sql)
    result = films.map { |movie| Film.new( movie ) }
    return result
  end

end