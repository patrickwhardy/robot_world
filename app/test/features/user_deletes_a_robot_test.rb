require_relative '../test_helper'

class UserCanDeleteAnExistingRobot < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_existing_robot_is_deleted_successfully
    create_robots

    visit '/robots'
    assert page.has_content? '1name'

    click_button 'delete1'

    refute page.has_content? '1name'

    teardown
  end

end
