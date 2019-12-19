module Localization
  extend ActiveSupport::Concern

  included do
    before_action :set_locale
    helper_method :en_locale_url, :ru_locale_url
  end

  def set_locale
    I18n.locale = extract_locale_from_subdomain || I18n.default_locale
  end

  def en_locale_url
    request.url.gsub(%r{://(en\.)?}, "://en.")
  end

  def ru_locale_url
    request.url.gsub(%r{://en\.}, "://")
  end

  protected

  def extract_locale_from_subdomain
    parsed_locale = request.subdomains.first
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end
end
