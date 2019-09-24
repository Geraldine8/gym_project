require_relative('../db/sql_runner')

class Booking

  attr_reader(:member_id, :gym_class_id, :id)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @member_id = options['member_id'].to_i
    @gym_class_id = options['gym_class_id'].to_i
  end

  def save()
    sql = "INSERT INTO bookings(member_id, gym_class_id)
    VALUES ($1, $2)
    RETURNING id"
    values = [@member_id, @gym_class_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def view_member_attending_to_class()
    sql = "SELECT m.* FROM m INNER JOIN "
  end

  def delete()
    sql = "SELECT FROM bookings WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = 'DELETE FROM bookings'
    SqlRunner.run(sql)
  end

  def member()
    sql = "SELECT * FROM members
    WHERE id = $1"
    values = [@member_id]
    results = SqlRunner.run( sql, values )
    return Member.new( results.first )
  end

  def gym_class()
    sql = "SELECT * FROM gym_classes
    WHERE id = $1"
    values = [@gym_class_id]
    results = SqlRunner.run( sql, values )
    return GymClass.new( results.first )
  end

  def self.member_by_class_id(gym_class_id)
    sql = "
      SELECT m.*
      FROM members m
      INNER JOIN bookings b ON m.id = b.member_id
      WHERE b.gym_class_id = $1"
    values = [gym_class_id]
    results = SqlRunner.run( sql, values )
    return results.map { |member| Member.new( member ) }
  end

  #Extensions: check class capaciity and memberships

  def has_spaces_available(gym_class)
    sql = "SELECT COUNT(id) FROM bookings WHERE gym_class_id = $1"
    values = [@gym_class_id]
    result = SqlRunner.run(sql, values).first
    return result['count'].to_i < gym_class.capacity
    # if result['count'].to_i < gym_class.capacity
    #   return true
    # else
    #   return false
    # end
  end

  #check duplication in class

  def has_member_booking_class()
    sql = "SELECT COUNT(*)FROM bookings WHERE member_id = $1 AND gym_class_id = $2"
    values = [@member_id, @gym_class_id]
    result = SqlRunner.run(sql, values).first
    return result['count'].to_i >= 1
  end

  def create_booking()
    member = Member.find(@member_id)
    gym_class = GymClass.find(@gym_class_id)

    return 'You cannot book same class twice' if has_member_booking_class() == true
    return 'Class fully booked, please select another class!' if has_spaces_available(gym_class) == false

    if member.premium == 1
      return 'Premium memberships can only book peak hour classes' if gym_class.is_peak_hour() == false
      save()
    else
      return 'Non-premium memberships cannot book classes during peak hours' if gym_class.is_peak_hour() == false
      save()
    end
    return nil
  end
end
