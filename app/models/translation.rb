class Translation < ApplicationRecord
    validates :source_language_code, :target_language_code, :source_text, presence: true
    validates_length_of :source_text, maximum: 500
end
