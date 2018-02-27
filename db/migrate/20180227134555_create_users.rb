# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.belongs_to :account, foreign_key: true
      t.string :country
      t.string :name

      t.timestamps
    end

    add_index :users, :country
  end
end
