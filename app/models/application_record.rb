class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  include SessionsHelper
  
  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
end
