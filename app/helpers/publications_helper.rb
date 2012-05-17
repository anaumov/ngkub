module PublicationsHelper
  def news_path(publication)
    publication_path(:slug => publication.slug, :id => publication.id)
  end
end
