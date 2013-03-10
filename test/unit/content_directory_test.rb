require "test_helper"

class ContentDirectoryTest < ActiveSupport::TestCase
  test "must be a Module" do
    assert_kind_of Module, ContentDirectory
  end
end
