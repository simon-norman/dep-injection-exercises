require './lib/exercise_3.rb'

describe Entry do
  it 'should create a new entry with the specified title and body' do
    title = 'Monday 5th'
    body = 'I played golf'
    entry = Entry.new(title, body)

    expect(entry.title).to eq(title)
    expect(entry.body).to eq(body)
  end
end

describe Diary do
  before(:each) do
    @title = 'Monday 5th'
    @body = 'I played golf'
    
    @entry_double = double(:entry, title: @title)
    @entry_class_double = double(:entry_class, new: @entry_double)

    @diary = Diary.new(@entry_class_double)
  end

  it 'should, when adding entries, create a new entry with the specified title and body' do
    @diary.add(@title, @body)

    expect(@entry_class_double).to have_received(:new).with(@title, @body)
  end

  it 'should add the new entry to the diary' do
    @diary.add(@title, @body)

    expect(@diary.entries).to eq([@entry_double])
  end

  it 'should return an index of all added diary entry titles' do
    2.times { @diary.add(@title, @body) }

    expected_titles = [ @title, @title ]
    expected_index = expected_titles.join("\n")

    expect(@diary.index).to eq(expected_index)
  end
end