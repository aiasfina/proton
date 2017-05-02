require 'test_helper'

class Proton::Backend::Test < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, Proton::Backend
  end
end
