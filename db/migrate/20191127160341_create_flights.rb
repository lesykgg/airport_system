# frozen_string_literal: true

class CreateFlights < ActiveRecord::Migration[6.0]
  def change
    create_table :flights do |t|
      t.integer :number
      t.string :from
      t.string :destination
      t.references :aircraft, null: false, foreign_key: true
      t.datetime :departure
      t.datetime :arrival
    end
  end
end
