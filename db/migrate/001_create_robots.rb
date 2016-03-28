require 'sequel'
# this path has been changed from /db/r_w_test
environments = ['test', 'development']

database = Sequel.sqlite('db/robot_world_#{env}.sqlite')
database.create_table :robots do
  primary_key :id
  String      :name
  String      :city
  String      :state
  String      :avatar
  String      :birthdate
  String      :date_hired
  String      :department
end
