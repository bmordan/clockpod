# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Staff.create(name: 'Bernard', start: '08:45:00', finish: '16:30:00')
Staff.create(name: 'Kelly', start: '08:30:00', finish: '16:00:00')

Clock.create(staff_id: 1, intime: '2013-11-18 08:45:00 +0000', out: '2013-11-18 16:32:00 +0000')
Clock.create(staff_id: 1, intime: '2013-11-19 08:49:00 +0000', out: '2013-11-19 17:43:00 +0000')
Clock.create(staff_id: 1, intime: '2013-11-20 07:23:00 +0000', out: '2013-11-20 16:47:00 +0000')
Clock.create(staff_id: 1, intime: '2013-11-21 08:30:00 +0000', out: '2013-11-21 16:27:00 +0000')
Clock.create(staff_id: 1, intime: '2013-11-22 08:43:00 +0000', out: '2013-11-22 16:38:00 +0000')

Clock.create(staff_id: 2, intime: '2013-11-18 08:30:00 +0000', out: '2013-11-18 15:32:00 +0000')
Clock.create(staff_id: 2, intime: '2013-11-19 08:02:00 +0000', out: '2013-11-19 17:43:00 +0000')
Clock.create(staff_id: 2, intime: '2013-11-20 07:02:00 +0000', out: '2013-11-20 15:47:00 +0000')
Clock.create(staff_id: 2, intime: '2013-11-21 08:30:00 +0000', out: '2013-11-21 16:00:00 +0000')
Clock.create(staff_id: 2, intime: '2013-11-22 08:33:00 +0000', out: '2013-11-22 15:38:00 +0000')

Clock.create(staff_id: 1, intime: '2013-12-09 08:30:00 +0000', out: '2013-12-09 16:00:00 +0000')
Clock.create(staff_id: 1, intime: '2013-12-10 08:34:00 +0000', out: '2013-12-10 17:43:00 +0000')
Clock.create(staff_id: 1, intime: '2013-12-11 07:34:00 +0000', out: '2013-12-11 16:47:00 +0000')
Clock.create(staff_id: 1, intime: '2013-12-12 08:30:00 +0000', out: '2013-12-12 16:15:00 +0000')
Clock.create(staff_id: 1, intime: '2013-12-13 08:43:00 +0000', out: '2013-12-13 16:38:00 +0000')

Reason.create(clock_id: 7, reason: 'Early morning breakfast meeting')

