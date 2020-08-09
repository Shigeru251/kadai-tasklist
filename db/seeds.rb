# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..10).each do |user|
   @usr = User.create(userid: 'usrNo' + user.to_s,password: 'password')
   (1..50).each do |tsk|
    @usr.tasks.create(content: 'usrNo' + user.to_s + 'taskNo' + tsk.to_s,status: 'st' + tsk.to_s)
   end
end

(1..100).each do |number|
#  Message.create(title: 'test title ' + number.to_s, content: 'test content ' + number.to_s)

#  Task.create!(content: 'task name=' + number.to_s, status: 'status=' + number.to_s)
  
end