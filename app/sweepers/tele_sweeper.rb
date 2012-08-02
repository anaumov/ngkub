class TeleSweeper < ActionController::Caching::Sweeper
  observe Tele

  def after_create(tele)
    expire_cache(tele)
  end

  def after_update(tele)
    expire_cache(tele)
  end

  def after_destroy(tele)
    expire_cache(tele)
  end

private
  def expire_cache(tele)
    expire_fragment('tele_index')
  end

end
