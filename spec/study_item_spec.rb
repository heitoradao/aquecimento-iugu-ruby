require 'spec_helper'

describe StudyItem do
  it 'MUST instantiate a itself' do
    study_item = StudyItem.new(title: 'Guard Clause', category: 'Ruby')

    expect(study_item).to be_instance_of(StudyItem)
  end
end
