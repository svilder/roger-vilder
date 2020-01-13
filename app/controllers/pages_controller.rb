class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]

  def home
    phrase = "Roger Vilder"
    @letters = phrase.split(//)
  end

  def contact
  end
end
