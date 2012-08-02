class BannerSweeper < ActionController::Caching::Sweeper
  observe Banner

  def after_create(banner)
    expire_cache(banner)
  end

  def after_update(banner)
    expire_cache(banner)
  end

  def after_destroy(banner)
    expire_cache(banner)
  end

private
  def expire_cache(banner)
    expire_fragment('top_banner')
    expire_fragment('left_banner')
    expire_fragment('right_banner')
  end


end
