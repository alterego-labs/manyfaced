require 'manyfaced/extensions/collection_renderable'

class ActiveRecord::Associations::CollectionProxy
  include Manyfaced::Extensions::CollectionRenderable

  def fetch_collection
    # @association.instance_variable_get(:@proxy)
    self.to_a
  end
end
