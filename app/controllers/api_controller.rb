class ApiController < ActionController::Base
	# Don't inherit from ApplicationController, we don't want sessions
   # nor do we need CSRF protection
end
