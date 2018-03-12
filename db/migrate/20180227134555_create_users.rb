# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.belongs_to :account, foreign_key: true

      t.string :name
      t.string :country
      t.string :timezone

      t.datetime :locked_at
      t.string   :lock_reason

      t.timestamps
    end

    add_index :users, :name
    add_index :users, :locked_at
  end
end
