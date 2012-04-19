class ApplicationController < ActionController::Base
  protect_from_forgery

  def render_403
     respond_to do |format|
       format.html { render :file => "#{Rails.root}/public/403.html",
:status => 403, :layout => false }
       format.json { render :json => { :type => "error", :message =>
"Error 403, you don't have permissions for this operation." } }
     end
   end

   def render_404
     respond_to do |format|
       format.html { render :file => "#{Rails.root}/public/404.html",
:status => 404, :layout => false }
       format.json { render :json => { :type => "error", :message =>
"Error 404, resource was not found." } }
     end
   end

end
