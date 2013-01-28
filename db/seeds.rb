# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# States
State.delete_all
state_new = State.create(:name => 'New',
             :background => '#85FF00',
             :color => 'white')
State.create(:name => 'Published',
             :background => '#00CFFD',
             :color => 'white')
State.create(:name => 'Closed',
             :background => 'black',
             :color => 'white')
State.create(:name => 'Done',
             :background => 'black',
             :color => 'white')

# Firms & Users
Firm.delete_all
User.delete_all

# Admin
admin_firm = Firm.create(:email => 'info@admin.ru', :name => "Admin")
admin_firm.save

admin_user = User.create(:email => 'info@admin.ru', 
                         :password => "123456")
admin_user.admin = true
admin_user.firm = admin_firm
admin_user.save

# Publisher
publisher_firm = Firm.create(:email => 'info@publisher.ru', :name => "Publisher")
publisher_firm.save

publisher_user = User.create(:email => 'info@publisher.ru', 
                   :password => "123456")
publisher_user.publisher = true
publisher_user.firm = publisher_firm
publisher_user.save

# Vendor
vendor_firm = Firm.create(:email => 'info@vendor.ru', :name => "Vendor")
vendor_firm.firm = publisher_firm
vendor_firm.save

vendor_user = User.create(:email => 'info@vendor.ru', 
                         :password => "123456")
vendor_user.firm = vendor_firm
vendor_user.save

# Project
Project.delete_all
Permission.delete_all
Stage.delete_all

prj = Project.create(:name => 'Portal', :description => 'Portal Descr', :number => 'P1')
prj.user = publisher_user
prj.firm = publisher_firm
prj.state = state_new
prj.type_id = 2
prj.save

stage = Stage.create!(:stage_start => Date.today, :state => state_new)
stage.project = prj 
stage.save

Permission.create!(:user => publisher_user,
                         :thing => prj,
                         :action => 'view')
Permission.create!(:user => publisher_user,
                         :thing => prj,
                         :action => 'edit')
