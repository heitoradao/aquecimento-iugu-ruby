require 'spec_helper'

describe StudyDiary do
  it 'SHOULD be able to instantiate itself' do
    study_diary = StudyDiary.new

    expect(study_diary).to be_instance_of(StudyDiary)
  end

  #it 'MUST HAVE means to insert new study tracking information' do
  #  expect(false).to eq(true)
  #end

  #it 'MUST HAVE means to recover information about study track' do
  #  open3
  #  expect(false).to eq(true)
  #end

  it 'SHOULD be able to persist study information between sessions' do
    expect(false).to eq(true)
  end

  it 'SHOULD work in non-interactive mode' do
    expect(false).to eq(true)
  end

  it 'SHOULD be able to export study info in JSON format' do
    expect(false).to eq(true)
  end

  it 'SHOULD be able to print study info with fancy colors' do
    expect(false).to eq(true)
  end
end
