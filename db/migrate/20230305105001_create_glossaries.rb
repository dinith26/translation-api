class CreateGlossaries < ActiveRecord::Migration[6.0]
  def change
    create_table :glossaries do |t|
      t.string :source_language_code
      t.string :target_laguage_code

      t.timestamps
    end
  end
end
