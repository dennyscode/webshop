class ApplicationController < ActionController::Base

  # Overwriting the sign_out redirect path method
 def after_sign_out_path_for(resource_or_scope)
   products_path
 end

 rescue_from CanCan::AccessDenied do |exception|
   redirect_to main_app.root_url, alert: exception.message
 end

 # protected
 # def authenticate_user!
 #   if user_signed_in?
 #     super
 #   else
 #     redirect_to new_user_session_path, :notice => 'You must login first' if request.original_fullpath != new_user_session_path
 #     ## if you want render 404 page
 #     ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
 #   end
 # end
end
