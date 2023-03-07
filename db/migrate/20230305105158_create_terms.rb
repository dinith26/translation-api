class CreateTerms < ActiveRecord::Migration[6.0]
  def change
    create_table :terms do |t|
      t.string :source_term
      t.string :target_term
      t.references :glossary, null: false, foreign_key: true

      t.timestamps
    end
  end
end
