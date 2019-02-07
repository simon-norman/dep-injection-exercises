class Note
    def initialize(title, body, formatter = NoteFormatter.new)
      @title = title
      @body = body
      @formatter = formatter
    end
  
    def display
      text = @formatter.format(self)
      return text
    end
  
    attr_reader :title, :body
  end
  
  class NoteFormatter
    def format(note)
      "Title: #{note.title}\n#{note.body}"
    end
  end