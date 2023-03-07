class CreateTranslations < ActiveRecord::Migration[6.0]
  def change
    create_table :translations do |t|
      t.string :source_language_code
      t.string :target_language_code
      t.string :source_text
      t.string :glossary_id

      t.timestamps
    end
  end
end
