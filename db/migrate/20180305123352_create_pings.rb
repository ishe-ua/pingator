# frozen_string_literal: true

class CreatePings < ActiveRecord::Migration[5.1]
  def change
    create_table :pings do |t| # rubocop:disable CreateTableWithTimestamps
      t.belongs_to :target, foreign_key: true

      t.datetime :start, null: false
      t.integer :duration, null: false

      t.integer :code, null: false
      t.text    :body
    end
  end
end
