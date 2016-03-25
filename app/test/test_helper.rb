ENV['RACK_ENV'] ||= 'test'

require File.expand_path('../../../config/environment', __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'capybara/dsl'
require 'tilt/erb'

Capybara.app = RobotWorldApp

module TestHelpers
  def teardown
    robot_world.delete_all
    super
  end

  def robot_world
    database = Sequel.sqlite('db/robot_world_test.sqlite')
    @robot_world ||= RobotWorld.new(database)
    # database = YAML::Store.new('db/robot_world_test')
    # @robot_world ||= RobotWorld.new(database)
  end

  def create_robots(num=2)
    num.times do |i|
      id = i + 1
      robot_world.create({
        :id         => id,
        :name       => "#{id}name",
        :city       => "#{id}city",
        :state      => "#{id}state",
        :avatar     => "https://robohash.org/#{id}",
        :birthdate  => "#{id} 04/03/1991",
        :date_hired => "#{id} 04/03/2015",
        :department => "#{id} department"
        })
    end
  end
end
