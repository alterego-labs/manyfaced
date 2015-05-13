class Hash
  include Manyfaced::Extensions::CollectionRenderable

  def fetch_collection
    values
  end
end
