# Generated via
#  `rails generate hyrax:work Work`
require 'rails_helper'

RSpec.describe Hyrax::WorkForm do
  subject       { form }
  let(:work)    { Work.new }
  let(:ability) { Ability.new(nil) }
  let(:request) { nil }
  let(:form)    { described_class.new(work, ability, request) }

  it 'has the expected terms' do
    expect(form.terms).to include(:title)
    expect(form.terms).to include(:year)
  end
end
