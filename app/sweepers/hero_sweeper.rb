class HeroSweeper < ActionController::Caching::Sweeper
  observe Hero

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
  def expire_cache(hero)
    expire_fragment('index_hero')
  end

end
