require 'rails_helper'

RSpec.describe Hyrax::WorkPresenter do
  subject(:presenter) { described_class.new(SolrDocument.new(work.to_solr), nil) }

  let(:title)      { ['Journey to Skull Island'] }
  let(:creator)    { ['Quest, Jane'] }
  let(:keyword)    { ['Pirates', 'Adventure'] }
  let(:visibility) { Hydra::AccessControls::AccessRight::VISIBILITY_TEXT_VALUE_PUBLIC }
  let(:user)       { 'test@example.com' }
  let(:year)       { ['2018'] }

  let :work do
    Work.new(title:      title,
             creator:    creator,
             keyword:    keyword,
             year:       year,
             visibility: visibility,
             depositor:  user)
  end

  it { is_expected.to have_attributes(title: title, year: year) }
end
