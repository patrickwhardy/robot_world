require_relative '../test_helper'

class RobotWorldTest < Minitest::Test
  include TestHelpers

  def test_it_creates_new_robots
    robot_world.create({
         :name       => "Patrick",
         :city       => "Denver",
         :state      => "CO",
         :avatar     => "https://robohash.org/k",
         :birthdate  => "04/03/1991",
         :date_hired => "04/03/2015",
         :department => "Shredding" })
        #  require 'pry', binding.pry
    robot = robot_world.all.last
    assert_equal "Patrick", robot.name
  end

  # def test_it_gives_all_robots
  # robot_world.
  #
  # end
end
