# Generated via
#  `rails generate hyrax:work Work`
require 'rails_helper'

RSpec.describe Work do
  describe '#year' do
    context 'with a new Work' do
      it 'has no value when it is first created' do
        work = Work.new
        expect(work.year).to be_empty
      end
    end

    context 'when year has been set' do
      it '' do
        work = Work.new
        work.year = ["2005"]
        expect(work.year).to eq(["2005"])
      end
    end
  end
end
