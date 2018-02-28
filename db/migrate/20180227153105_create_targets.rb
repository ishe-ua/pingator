# frozen_string_literal: true

class CreateTargets < ActiveRecord::Migration[5.1]
  def change
    create_table :targets do |t|
      t.belongs_to :user, foreign_key: true

      t.string :url

      t.integer  :check_time
      t.datetime :checked_at, default: nil

      t.datetime :verified_at, default: nil
      t.string   :verification_token

      t.timestamps
    end

    add_index :targets, :url
    add_index :targets, :check_time

    add_index :targets, :verified_at
    add_index :targets, :verification_token, unique: true
  end
end
