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
    robot = robot_world.all.last
    assert_equal "Patrick", robot.name
  end

  def test_it_can_find_all_robots
    create_robots

    all_robots = robot_world.all

    assert_equal Array, all_robots.class
    assert_equal 2, all_robots.size
    assert_equal "1name", all_robots.first.name
  end

  def test_it_can_find_a_specific_robot
end
