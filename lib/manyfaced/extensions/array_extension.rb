require 'manyfaced/extensions/collection_renderable'

class Array
  include Manyfaced::Extensions::CollectionRenderable

  def fetch_collection
    self
  end
end
