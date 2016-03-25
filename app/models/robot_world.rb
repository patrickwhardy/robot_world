require 'yaml/store'
# require_relative 'robot'

class RobotWorld
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(robot)
    database.from(:robots).insert(robot)
    # database.transaction do
    #   database['robots'] ||= []
    #   database['total']  ||= 0
    #   database['total']   += 1
    #   database['robots'] << {"id"         => database['total'],
    #                          "name"       => robot[:name],
    #                          "city"       => robot[:city],
    #                          "state"      => robot[:state],
    #                          "avatar"     => robot[:avatar],
    #                          "birthdate"  => robot[:birthdate],
    #                          "date_hired" => robot[:date_hired],
    #                          "department" => robot[:department] }
    # end
  end

  # def raw_robots
  #   database.transaction do
  #     database["robots"] || []
  #   end
  # end

  def all
    database.from(:robots).map {|data| Robot.new(data)}
    # raw_robots.map { |robot| Robot.new(robot) }
  end

  # def raw_robot(id)
  #   raw_robots.find { |robot| robot["id"] == id }
  # end

  def find(id)
    raw_robot = database.from(:robots).where(:id => id).to_a.first
    Robot.new(raw_robot)
  end

  def update(id, robot)
    database.from(:robots).where(id.to_s).update(
      :name       => robot[:name],
      :city       => robot[:city],
      :state      => robot[:state],
      :avatar     => robot[:avatar],
      :birthdate  => robot[:birthdate],
      :date_hired => robot[:date_hired],
      :department => robot[:department]
    )
  end
    # database.transaction do
    #   target = database["robots"].find { |data| data["id"] == id.to_i }
    #   target["name"]           = robot[:name]
    #   target["city"]           = robot[:city]
    #   target["state"]          = robot[:state]
    #   target["avatar"]         = robot[:avatar]
    #   target["birthday"]       = robot[:birthday]
    #   target["date_hired"]     = robot[:date_hired]
    #   target["department"]     = robot[:department]
    # end

  def delete(id)
    database.from(:robots).where(id.to_s).delete
    # database.transaction do
    #   database["robots"].delete_if { |data| data["id"] == id}
    # end
  end

  def delete_all
    database.from(:robots).delete
    # database.transaction do
    #   database['robots'] = []
    #   database['total'] = 0
    # end
  end

  end
