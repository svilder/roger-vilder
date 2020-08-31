class ApplicationController < ActionController::Base
  before_action :set_locale

  def default_url_options
    { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale }
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  private

  def set_locale
    I18n.locale = params.fetch(:locale, I18n.default_locale).to_sym
  end

  def set_default_text
    @text = Text.all.order(year: :desc).first
  end
end
