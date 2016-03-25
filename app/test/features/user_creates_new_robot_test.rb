require_relative '../test_helper'

class UserCanCreateANewRobot < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_robot_creation_with_valid_attributes
    visit 'robots/new'

    fill_in 'robot[name]', with: 'example robot'
    fill_in 'robot[city]', with: 'example city'
    fill_in 'robot[state]', with: 'example state'
    fill_in 'robot[avatar]', with: 'example avatar'
    fill_in 'robot[birthdate]', with: 'example birthdate'
    fill_in 'robot[date_hired]', with: 'example date'
    fill_in 'robot[department]', with: 'example department'
    click_button 'submit'

    assert_equal '/robots', current_path

    within '.robot' do
      assert page.has_content? 'example robot'
    end
  end
end
