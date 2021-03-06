require_relative '../test_helper'

class UserCanDeleteAnExistingRobot < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_existing_robot_is_deleted_successfully
    create_robots
    robot = robot_world.all.last
    visit '/robots'

    assert page.has_content? "#{robot.name}"

    click_button "delete robot ##{robot.id}"

    refute page.has_content? "#{robot.id}name"
  end

end
