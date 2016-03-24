class Robot
  attr_reader :id,
              :name,
              :city,
              :state,
              :avatar,
              :birthdate,
              :date_hired,
              :department

  def initialize(data)
    @id = data["id"]
    @name = data["name"]
    @city = data["city"]
    @state = data["state"]
    @avatar = data["avatar"]
    @birthdate = data["birthdate"]
    @date_hired = data["date_hired"]
    @department = data["department"]
  end
end

# require 'faker'
# @name = Faker::Name.name
# @city = Faker::Address.city
# @state = Faker::Address.state
# @avatar = Faker::Avatar.image
# @birthdate = Faker::Date.backward(9999)
# @date_hired = Faker::Date.backward(999)
# @department = Faker::Commerce.department
