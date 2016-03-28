require_relative '../test_helper'

class UserCanDeleteAnExistingRobot < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_index_displays_all_robots
    create_robots
    robot = robot_world.all.last

    visit '/robots'

    assert page.has_content? "#{robot.name}"

  end
end
