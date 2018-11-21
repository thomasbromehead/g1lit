class ApplicationController < ActionController::Base

# To make methods here available in our views:
# helper_method :method-name, :other_method_name

# Always have before_actions set in the order you want them to execute

=begin ie:
def current_user

  @current_user ||= User.find(params[:session_id]) if session[:user_id]

end

def logged_in?
  !!current_user bang bang converts to boolean
end
=end

end
