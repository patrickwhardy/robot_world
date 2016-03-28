require_relative '../test_helper'

class RobotWorldTest < Minitest::Test
  include TestHelpers

  def setup
    create_robots

    @robot = robot_world.all.last
  end

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
    all_robots = robot_world.all
    assert_equal Array, all_robots.class
    assert_equal 2, all_robots.size
    assert_equal "1name", all_robots.first.name
  end

  def test_it_can_find_a_specific_robot
    found_bot = robot_world.find(@robot.id)

    assert_equal @robot.id, found_bot.id
    assert_equal Robot, found_bot.class
  end

  def test_update_changes_robot_info
    skip
    assert_equal "2name", @robot.name
    @robot.name = "Muhammad"
    robot_world.update(@robot.id, @robot)
  end

  def test_delete_robot
    # skip :: not sure how to input this data?
    robot_world.delete(@robot.id)

    assert_equal 1, robot_world.all.count
  end

  def test_delete_all_deletes_all_bots
    assert_equal 2, robot_world.all.count
    robot_world.delete_all
    assert_equal 0, robot_world.all.count
  end
end
