require "redcarpet"
require "yaml"

module ContentDirectory
  class Entry
    attr_reader :path, :text, :metadata

    def initialize(path)
      @path = path
      @text = File.read "#{ContentDirectory.root}/#{@path}"
      @metadata = @text.split("\n\n").first

      begin
        @metadata = YAML.load @metadata
        @text = @text.split("\n\n", 2).last
      rescue Exception => e
        @metadata = nil
      end
    end

    def html
      markdown = Redcarpet::Markdown.new Redcarpet::Render::HTML
      html = markdown.render @text
      Redcarpet::Render::SmartyPants.render html
    end
  end
end
