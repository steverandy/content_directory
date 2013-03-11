require "redcarpet"
require "yaml"

module ContentDirectory
  class Entry
    attr_reader :path, :text, :metadata

    def initialize(path)
      @path = path
      @text = File.read "#{ContentDirectory.root}/#{@path}"
      @metadata, @text = @text.split("\n\n", 2)

      begin
        @metadata = YAML.load @metadata
      rescue Exception => e
        @metadata = nil
      end
    end

    def html
      return nil unless @text
      markdown = Redcarpet::Markdown.new Redcarpet::Render::HTML
      html = markdown.render @text
      Redcarpet::Render::SmartyPants.render html
    end
  end
end
