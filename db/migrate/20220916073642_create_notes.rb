class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.string :noteTitle
      t.text :note
      t.timestamps
    end
  end
end
