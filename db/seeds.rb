# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "removing services..."
Service.all.each { |svc| svc.destroy }
puts "removing actions..."
Job.all.each {|a| a.destroy }

Service.create([
	{id: 1, svcname: "svc1", status: "online"},
	{id:2, svcname: "svc2", status: "offline"},
	{id:3 ,svcname: "svc3", status: "offline"},
])

[ 'start', 'stop', 'refresh'].each { |a| Job.create( service_id: 1, jobname: a, status: 'unknown') }
[ 'refresh', 'refresh'].each { |a| Job.create( service_id: 2, jobname: a, status: 'unknown') }

puts "services created: #{Service.all.count()}"
puts "jobs created: #{Job.all.count()}"
