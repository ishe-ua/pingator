# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.belongs_to :account, foreign_key: true
      t.string :country
      t.string :name

      t.boolean :suspend, default: false
      t.timestamps
    end

    add_index :users, :country
    add_index :users, :suspend
  end
end
