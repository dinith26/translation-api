class Term < ApplicationRecord
  belongs_to :Glossary

  validates_presence_of :source_term, :target_term
end
