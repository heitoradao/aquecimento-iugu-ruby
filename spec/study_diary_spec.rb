require 'spec_helper'

describe StudyDiary do
  it 'SHOULD be able to instantiate itself' do
    study_diary = StudyDiary.new

    expect(study_diary).to be_instance_of(StudyDiary)
  end

  it 'MUST HAVE means to insert and retrieve study tracking information' do
    title = 'Guard Clause'
    category = 'Ruby'

    diary = StudyDiary.new
    diary.register([title, category])

    stdout_backup = $stdout
    $stdout = StringIO.new
    diary.print_items

    resultado = $stdout.string
    $stdout = stdout_backup

    expect(resultado).to eq("#1 - #{title} - #{category}\n")
  end

  it 'SHOULD be able to persist study information between sessions' do
    expect(false).to eq(true)
  end

  #it 'SHOULD work in non-interactive mode' do
    # by doing at least insertion, retrieval, completion
    # would be nice if could export to json
  #  expect(false).to eq(true)
  #end

  it 'SHOULD be able to export study info in JSON format' do
    expect(false).to eq(true)
  end

  it 'SHOULD be able to print study info with fancy colors' do
    expect(false).to eq(true)
  end
end
