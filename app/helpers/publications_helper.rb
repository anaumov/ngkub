module PublicationsHelper
  def news_path(publication)
    publication_path(publication.slug, publication)
  end
end
