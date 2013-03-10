require "test_helper"

class EntryTest < ActiveSupport::TestCase
  test "entry" do
    ContentDirectory.root = File.expand_path("../../support/content", __FILE__)
    home = ContentDirectory.find "home"
    main = home["main"]
    assert_kind_of ContentDirectory::Entry, main
    assert_equal "Main", main.metadata["Title"]
    assert_equal "2013/03/10", main.metadata["Last Modified"]
    assert_equal "Build software better, together.\n\nPowerful collaboration, review, and code management for open source and private development projects.\n", main.text
    assert_equal "<p>Build software better, together.</p>\n\n<p>Powerful collaboration, review, and code management for open source and private development projects.</p>\n", main.html
  end
end
