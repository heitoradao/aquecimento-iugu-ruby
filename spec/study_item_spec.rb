require 'spec_helper'

describe StudyItem do
  it 'MUST instantiate itself' do
    study_item = StudyItem.new(title: 'Guard Clause', category: 'Ruby')

    expect(study_item).to be_instance_of(StudyItem)
  end
  
  it 'MUST retain the title and category passed to constructor' do
    title = 'Guard Clause'
    category = 'Ruby'
    study_item = StudyItem.new(title: title, category: category)
    
    expect(study_item.title).to eq(title)
    expect(study_item.category).to eq(category)
  end
  
  it 'SHOULD be able to change the title' do
    study_item = StudyItem.new(title: 'optparser', category: 'Gem')
    new_title = 'gli'
    study_item.title = new_title
    
    expect(study_item.title).to eq(new_title)
  end
  
  it 'SHOULD be able to change the category' do
    study_item = StudyItem.new(title: 'Unit Test', category: 'Ruby')
    new_category = 'RSpec'
    study_item.category = new_category
    
    expect(study_item.category).to eq(new_category)
  end
end
