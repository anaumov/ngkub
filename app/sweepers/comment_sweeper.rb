class CommentSweeper < ActionController::Caching::Sweeper
  observe Comment
  
  def after_create(comment)
    expire_cache(comment)
  end
  
  def after_destroy(comment)
    expire_cache(comment)
  end

private
  def expire_cache(comment)
    expire_action(:controller => 'publications', :action => 'show', :id => comment.commentable.id )
    expire_action(:controller => 'heros', :action => 'show', :id => comment.commentable.id )
    expire_action(:controller => 'interviews', :action => 'show', :id => comment.commentable.id )
    expire_action(:controller => 'teles', :action => 'show', :id => comment.commentable.id )

    expire_fragment('lastest_comments')
  end
end
