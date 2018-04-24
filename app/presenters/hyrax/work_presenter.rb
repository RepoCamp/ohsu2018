module Hyrax
  class WorkPresenter < Hyrax::WorkShowPresenter
    delegate :year, to: :solr_document
  end
end
