# frozen_string_literal: true

class CreateStates < ActiveRecord::Migration[5.1]
  def change
    create_table :states do |t| # rubocop:disable CreateTableWithTimestamps
      t.belongs_to :target, foreign_key: true

      t.datetime :time, null: false
      t.integer  :type, null: false

      t.integer :code, null: false
      t.text    :body
    end
  end
end
