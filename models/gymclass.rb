require_relative('../db/sql_runner')

class GymClass

  attr_reader(:id, :name, :capacity, :timetable)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @capacity = options['capacity'].to_i
    @timetable = options['timetable']
  end

  def save()
    sql = "INSERT INTO gym_classes (name, capacity, timetable)
    VALUES ($1, $2, $3)
    RETURNING id"
    values = [@name, @capacity, @timetable]
    result = SqlRunner.run(sql, values)
    @id = result.first()['id'].to_i
  end

  def delete()
    sql = "SELECT FROM gym_classes WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end


  def update()
    sql = "UPDATE FROM gym_classes (name, capacity, timetable) = ($1, $2, $3)
    WHERE id = $1"
    values = [@name, @capacity, @timetable]
    SqlRunner.run(sql, values)
  end


  def self.delete_all()
    sql = "DELETE FROM gym_classes"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM gym_classes WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql)
    return GymClass.new(result.first)
  end

end
