class AddNoteBookToNote < ActiveRecord::Migration[6.1]
  def change
    add_reference :notes, :notebooks, null: false, foreign_key: true
  end
end
