# frozen_string_literal: true

class CreateChecks < ActiveRecord::Migration[5.1]
  def change
    create_table :checks do |t| # rubocop:disable CreateTableWithTimestamps
      t.belongs_to :target, foreign_key: true
      t.datetime :time, null: false

      t.integer :duration, null: false, comment: 'response duration'
      t.integer :code,     null: false, comment: 'response code'
      t.text    :body,                  comment: 'response body'
    end
  end
end
