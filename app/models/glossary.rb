class Glossary < ApplicationRecord
    has_many :terms

    validates :source_language_code, :target_laguage_code, presence: true
end
