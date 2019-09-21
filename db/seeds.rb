require_relative( "../models/member.rb" )
require_relative("../models/booking.rb")
require_relative("../models/gymclass.rb")
require("pry-byebug")

Member.all()
Member.delete_all()
GymClass.delete_all()
Booking.delete_all()


member1 = Member.new({
  "first_name" => "Anna",
  "last_name" => "Barbone",
  "contact_number" => "07478635245",
  "email" => "a.barbone@gmail.com",
  "premium" => 1
  })
member1.save()

member2 = Member.new({
  "first_name" => "Lety",
  "last_name" => "White",
  "contact_number" => "07489735213",
  "email" => "lety.@gmail.com",
  "premium" => 0
})
member2.save()

member3 = Member.new({
  "first_name" => "Kirsty",
  "last_name" => "Nicol",
  "contact_number" => "07467543120",
  "email" => "kirsty.nicol@gmail.com",
  "premium" => 1
})
member3.save()

gym_class1 = GymClass.new({
  "name" => "Yoga",
  "capacity" => 20,
  "timetable" => "18:00"
  })

gym_class1.save()

gym_class2 = GymClass.new({
  "name" => "Cycle",
  "capacity" => 25,
  "timetable" => "17:00"
  })
gym_class2.save()

gym_class3 = GymClass.new({
  "name" => "Bootcamp",
  "capacity" => 15,
  "timetable" => "19:00"
  })
gym_class3.save()

gym_class4 = GymClass.new({
  "name" => "Absolute Abs",
  "capacity" => 20,
  "timetable" => "14:00"
  })
gym_class4.save()

booking1 = Booking.new({
  "member_id" => member1.id,
  "gym_class_id" => gym_class2.id
  })
booking1.save()

booking2 = Booking.new({
  "member_id" => member2.id,
  "gym_class_id" => gym_class3.id
  })
  booking2.save()

booking3 = Booking.new({
  "member_id" => member3.id,
  "gym_class_id" => gym_class4.id
  })
  booking3.save()



binding.pry
nil
