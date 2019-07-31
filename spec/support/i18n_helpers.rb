# frozen_string_literal: true

module I18nHelpers
  def store_translations(locale, data)
    I18n.backend.store_translations(locale, data)
  end
end
