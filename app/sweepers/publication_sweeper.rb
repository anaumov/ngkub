class PublicationSweeper < ActionController::Caching::Sweeper
  observe Publication
  
  def after_create(hero)
    expire_cache(hero)
  end

  def after_update(hero)
    expire_cache(hero)
  end

  def after_destroy(hero)
    expire_cache(hero)
  end

private
  def expire_cache(publication)
    expire_fragment('pub_related')
    expire_fragment('slider')
    expire_fragment('main_theme')
    expire_fragment('last_news')
 
  end


end
