require './lib/exercise_1.rb'

describe NoteFormatter do
  it 'formats note with title first, then body below' do
    note_formatter = NoteFormatter.new
    note_double = double(:note, title: 'To do list', body: 'Code all day')

    expected_formatted_note = "Title: #{note_double.title}\n#{note_double.body}"

    expect(note_formatter.format(note_double)).to eq(expected_formatted_note)
  end
end

describe Note do
  it 'displays formatted note' do
    title = 'To do list'
    body = 'Code all day'
    formatter_double = double(:formatter, format: "Title: #{title}\n#{body}")

    note = Note.new(title, body, formatter_double)

    expected_formatted_note = "Title: #{title}\n#{body}"

    expect(note.display).to eq(expected_formatted_note)
    expect(formatter_double).to have_received(:format).once.with(note)
  end
end