class CreateTargets < ActiveRecord::Migration[5.1]
  def change
    create_table :targets do |t|
      t.belongs_to :user, foreign_key: true
      t.string :url, null: false

      t.timestamps
    end

    add_index :targets, :url, unique: true
  end
end
