class StaticController < ApplicationController
  before_filter :check_logged_in

  def home
  end

  private
    def check_logged_in
      if user_signed_in?
        redirect_to items_path
      end
    end

end
