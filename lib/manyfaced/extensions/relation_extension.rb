require 'manyfaced/extensions/collection_renderable'

class ActiveRecord::Relation
  include Manyfaced::Extensions::CollectionRenderable

  def fetch_collection
    self.to_a
  end
end
