class Author < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :phone_number, format: { with: /\A\(?\d{3}\)?[- ]?\d{3}[- ]?\d{4}\z/,
                              message: I18n.t('global.errors.phone_format')}
end
