class ComplaintSweeper < ActionController::Caching::Sweeper
  observe Complaint

  def after_create(complaint)
    expire_cache(complaint)
  end

  def after_update(complaint)
    expire_cache(complaint)
  end

  def after_destroy(complaint)
    expire_cache(complaint)
  end

private
  def expire_cache(complaint)
    expire_fragment('last_complaints')
  end

end
