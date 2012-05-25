class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :prepare_menu, :except => [ :create, :update, :destroy]
  

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
    
   def check_user
     unless current_user and current_user.admin?
      render_404
      return
    end
   end

   def check_publish(pub)
    unless pub.publish? || !check_user  
      render_404
      return
    end
   end

private
  def prepare_menu
    mmmenu do |top|
      top.add :reklama, "/reklama"
      top.add :contact_us, "/email_us"
    end 
  end
    

end
