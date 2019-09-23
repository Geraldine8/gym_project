require 'time'
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
    sql = "DELETE FROM gym_classes WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end


  def update()
    sql = "UPDATE FROM gym_classes (name, capacity, timetable) = ($1, $2, $3)
    WHERE id = $1"
    values = [@name, @capacity, @timetable]
    SqlRunner.run(sql, values)
  end

  def is_peak_hour()
    class_time = Time.parse(@timetable)
    return  class_time.hour.between?(7, 9) || class_time.hour.between?(15, 18)
  end

  #Format time:
  #%I:Hour of the day, 12-hour clock, zero-padded (01..12)
  #%M Minute of the hour (00..59)
  #%p Meridian indicator, uppercase (``AM'' or ``PM'')

  def name_and_time()
    time = Time.parse(@timetable)
    return "#{@name} - #{time.strftime("%I:%M%p")}"
  end

  def self.all()
    sql = "SELECT * FROM gym_classes"
    results = SqlRunner.run(sql)
    return results.map{|gym_class| GymClass.new(gym_class)}
  end


  def self.delete_all()
    sql = "DELETE FROM gym_classes"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM gym_classes WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return GymClass.new(result.first)
  end



end
