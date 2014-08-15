module OrdinaryCms
  class Page
    include Mongoid::Document
    include ActsAsPage
  end
end