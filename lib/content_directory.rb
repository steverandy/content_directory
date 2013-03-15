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
    result = {}
    valid_entry_extensions = %w(.md .markdown .txt .text)
    valid_entry_extensions_regex = /.*(#{valid_entry_extensions.join('|\\').prepend('\\')})$/i

    begin
      entries = Dir.entries "#{root}/#{path}"
    rescue Exception => e
      return nil
    end

    entries.reject! do |entry|
      entry[0] == "." || entry.include?(".") && !entry.match(valid_entry_extensions_regex)
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
