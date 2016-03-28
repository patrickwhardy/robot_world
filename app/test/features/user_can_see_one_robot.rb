require_relative '../test_helper'

class UserCanCreateANewRobot < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_user_can_see_one_robot
    create_robots
    robot = robot_world.all.last
    visit "/robots/#{robot.id}"

    assert page.has_content? "#{robot.name}"

  end

end
