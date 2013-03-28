class ApplicationController < ActionController::Base
  protect_from_forgery

  def render_403
     respond_to do |format|
       format.html { render "#{Rails.root}/public/403.html", status: 403, layout: false }
     end
   end

   def render_404
     respond_to do |format|
       format.html { render "#{Rails.root}/public/404.html", status: 404, layout: false }
     end
   end
    
   def check_user
     return render_404 unless current_user
   end

   def check_publish(pub)
     return render_404 unless pub.publish? || !check_user
   end
end
