class CreateEventlists < ActiveRecord::Migration[6.1]
  def change
    create_table :eventlists do |t|
      t.references :user, null: false, foreign_key: true
      t.json :eventlist_in_json
      t.timestamps
    end
  end
end
