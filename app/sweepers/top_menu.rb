class CategorySweeper < ActionController::Caching::Sweeper
  observe Category

  def after_create(category)
    expire_cache(category)
  end

  def after_update(category)
    expire_cache(category)
  end

  def after_destroy(category)
    expire_cache(category)
  end

private
  def expire_cache(category)
    expire_fragment('top_menu')
  end

end
