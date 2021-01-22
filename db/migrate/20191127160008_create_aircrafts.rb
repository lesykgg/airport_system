# frozen_string_literal: true

class CreateAircrafts < ActiveRecord::Migration[6.0]
  def change
    create_table :aircrafts do |t|
      t.string :manufacturer
      t.string :model
      t.integer :capacity
      t.references :airline, null: false, foreign_key: true
    end
  end
end
