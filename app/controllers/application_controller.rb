class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def string_to_date(date)
		Date.strptime(date,"%d/%m/%Y") rescue ''
  end
end
