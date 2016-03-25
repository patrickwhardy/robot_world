require_relative '../test_helper'

class RobotTest < Minitest::Test

  def test_assigns_attributes
    robot = Robot.new({
         "id"         => 1,
         "name"       => "Patrick",
         "city"       => "Denver",
         "state"      => "CO",
         "avatar"     => "https://robohash.org/k",
         "birthdate"  => "04/03/1991",
         "date_hired" => "04/03/2015",
         "department" => "Shredding" })
    assert_equal "Patrick", robot.name
    assert_equal "CO", robot.state
    assert_equal Robot, robot.class
  end

end
