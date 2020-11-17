class ApplicationController < ActionController::Base
rescue_from ActiveRecord::RecordNotFound, with: :not_found

def not_found
    flash[:error] = "This action is not valid"
  redirect_to root_path
end
    
end
