# Content Directory

Content Directory is a lightweight replacement of a Content Management System (CMS). It provides structure for text based content. It comes with a parser, which allows content entries to have metadata and rich formatting.

## Structure

Content Directory does not require a database. Instead, it uses file system. An entry is a file written in Markdown syntax. You can group related entries in a folder.

    - content
      - home
        - main.md
        - features
          - collaboration.md
          - manage.md
      - posts
        - a-new-blog.md
        - sortable-stars.md
  
## Writing entries

Entry uses Markdown syntax, but there is an additional rule that every entry must have a metadata declaration on the top. Metadata declaration block uses YAML syntax.

    Title: Introduction
    Date: 2013/03/10
    Tags: ["post", "short"]

    It was a bright cold day in April, and the clocks were striking
    thirteen. Winston Smith, his chin nuzzled into his breast in an
    effort to escape the vile wind, slipped quickly through the
    glass doors of *Victory Mansions*, though not quickly enough to
    prevent a swirl of gritty dust from entering along with him. 

    The hallway smelt of boiled cabbage and old rag mats. At one end
    of it a coloured poster, too large for indoor display, had been
    tacked to the wall. It depicted simply an **enormous** face,
    more than a metre wide: the face of a man of about forty-five,
    with a heavy black moustache and ruggedly handsome features.

## Reading entries

Once you have written entries, you can use `ContentDirectory.find` to get the processed entries and render them into views.

`ContentDirectory.find` returns a `Hash` of `ContentDirectory::Entry`. It accepts one argument, which is a path relative to `ContentDirectory.root`. If path is not specified, `ContentDirectory.find` will find all possible entries.

    posts = ContentDirectory.find "posts"

You can use metadata to sort posts by date

    posts = ContentDirectory.find("posts").values
    posts.sort_by! { |post| post.metadata["Date"] }

Entry has three important values: `metadata`, `text`, `html`. 

1. `metadata` is a `Hash` of parsed metadata block from entry file. 
2. `text` is a `String` of original entry text. 
3. `html` is a `String` of the result of original text after processed by Redcarpet Markdown parser.

    for post in posts
      puts post.metadata["Title"]
      puts post.text
      puts post.html
    end

## Installation

Add this line to your application's Gemfile:

    gem "content_directory"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install content_directory

## Configuration

    ContentDirectory.root = "path/to/content"

## Test

    rake test

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
