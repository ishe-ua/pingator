# frozen_string_literal: true

class CreateTargets < ActiveRecord::Migration[5.1]
  def change
    create_table :targets do |t|
      t.belongs_to :user, foreign_key: true

      t.string :url,  null: false
      t.float  :plan, null: false

      t.datetime :verified_at
      t.string   :verification_token

      t.datetime :locked_at
      t.integer  :lock_reason

      t.timestamps
    end

    add_index :targets, :url
    add_index :targets, :plan

    add_index :targets, :verified_at
    add_index :targets, :verification_token, unique: true

    add_index :targets, :locked_at
  end
end
