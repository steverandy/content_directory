require "content_directory/version"
require "content_directory/entry"

module ContentDirectory
  def self.root=(path)
    @root = path
  end

  def self.root
    if @root
      @root
    elsif defined? Rails
      "#{Rails.root}/content"
    else
      "content"
    end
  end

  def self.find(path=nil)
    entries = Dir.entries "#{root}/#{path}"
    result = {}

    entries.reject! do |entry|
      entry[0] == "." || entry.include?(".") && !entry.include?(".md")
    end

    entries.each do |entry|
      if entry.include? "."
        result[entry.split(".")[0]] = Entry.new "#{path}/#{entry}"
      else
        result[entry] = find("#{path}/#{entry}")
      end
    end

    return result
  end
end
