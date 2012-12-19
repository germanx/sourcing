# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
admin_user = User.create(:email => 'german@cma.ru', 
                         :password => "123456")
admin_user.admin = true
admin_user.save

Project.delete_all
prj = Project.create(:name => 'Ticketee', :description => 'Ticketee Descr', :number => 'P1')
prj.user = admin_user
prj.save

State.delete_all
State.create(:name => 'New',
             :background => '#85FF00',
             :color => 'white')
State.create(:name => 'Open',
             :background => '#00CFFD',
             :color => 'white')
State.create(:name => 'Closed',
             :background => 'black',
             :color => 'white')
