module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end
  
  def meta_description(meta_descr)
    content_for(:meta_descr) { meta_descr }
  end

  def check_show(pub)
    unless (current_user and current_user.admin?) || pub.publish?  
      return false
    end
    return true
   end
 end
