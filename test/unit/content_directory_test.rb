require "test_helper"

class ContentDirectoryTest < ActiveSupport::TestCase
  test "must be a Module" do
    assert_kind_of Module, ContentDirectory
  end

  test "root" do
    ContentDirectory.root = nil
    assert_equal "content", ContentDirectory.root
    ContentDirectory.root = "mycontent"
    assert_equal "mycontent", ContentDirectory.root
  end

  test "find" do
    ContentDirectory.root = File.expand_path("../../support/content", __FILE__)

    content = ContentDirectory.find
    assert_equal 2, content.length

    home = ContentDirectory.find "home"
    assert_equal 2, home.length
    assert_equal 2, home["features"].length
    assert_kind_of ContentDirectory::Entry, home["main"]
  end
end
