require_relative('../db/sql_runner')

class Member

  attr_reader(:id, :first_name, :last_name, :contact_number,:email, :premium)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @contact_number = options['contact_number']
    @email = options['email']
    @premium = options['premium'].to_i
  end

  def save()
    sql = "INSERT INTO members
    (first_name, last_name, contact_number, email, premium)
    VALUES ($1, $2, $3, $4, $5)
    RETURNING id"
    values = [@first_name, @last_name, @contact_number, @email, @premium]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def delete()
    sql = "SELECT FROM members WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = 'DELETE FROM members'
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE FROM members (first_name, last_name, contact_number, email
    email, premium) = ($1, $2, $3, $4, $5)
    WHERE id = $1"
    values = [@first_name, @last_name, @contact_number, @email, @premium]
    SqlRunner.run(sql, values)

  end

  #Class method

  def self.find(id)
    sql = "SELECT * FROM members WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Member.new(result.first)
  end

  def self.all()
    sql = "SELECT * FROM members WHERE id = $1"
    result = SqlRunner.run(sql)
    return results.map{|member| Member.new(member)}
  end

end
