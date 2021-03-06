module ControllerMacros

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

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods

    def it_should_render_404_if_the_resource_was_not_found(actions)
      get_actions_hash(actions).each do |action, verb|
        it "#{action} action should render 404 if the resource was not found" do
          #login_account
          begin
            process(action, {:id => 0} , nil, nil, verb.to_s.upcase)
          rescue #BSON::InvalidObjectId 
            record_not_found = true
          end
          response.should render_404 unless record_not_found
        end
      end
    end

    private

    def get_actions_hash(actions)
      if actions.kind_of?(Array)
        new_actions = {}
        actions.each do |a|

          if a.kind_of?(Array)
            new_actions[a[0]] = a[1]
          else
            case a
              when :create
                new_actions[a] = :post
              when :update
                new_actions[a] = :put
              when :destroy
                new_actions[a] = :delete
              else
                new_actions[a] = :get
            end
          end
        end
        return new_actions
      else
        return actions
      end
    end

  end

end

