class InterviewSweeper < ActionController::Caching::Sweeper
  observe Interview

  def after_create(interview)
    expire_cache(interview)
  end

  def after_update(interview)
    expire_cache(interview)
  end

  def after_destroy(interview)
    expire_cache(interview)
  end

private
  def expire_cache(interview)
    expire_fragment('interview_index')
  end

end
