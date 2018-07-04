class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  include LocaleFromBrowserConcern

  def user_locale
    current_user.locale if current_user
  end
end
