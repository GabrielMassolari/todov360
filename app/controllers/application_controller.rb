class ApplicationController < ActionController::Base
  layout :layout

  private
    def layout
    if devise_controller? && resource_name == :user && action_name == 'new' 
        "devise" 
    else 
        "application" 
    end
      
        #is_a?(Devise::SessionsController) ? false : 'application'

      # or turn layout off for every devise controller:
      # devise_controller? && "application"
    end

end
