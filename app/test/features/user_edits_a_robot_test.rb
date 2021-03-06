require_relative '../test_helper'

class UserCanEditAnExistingRobot < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_existing_robot_is_updated_with_new_info
    create_robots

    robot = robot_world.all.last

    visit "/robots/#{robot.id}/edit"
    fill_in "robot[name]", with: "new name"
    fill_in "robot[birthdate]", with: "11/11/1111"
    click_button "submit"

    assert_equal "/robots/#{robot.id}", current_path

    within "h1" do
      assert page.has_content? "new name"
    end
  end
end
