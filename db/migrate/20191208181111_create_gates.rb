# frozen_string_literal: true

class CreateGates < ActiveRecord::Migration[6.0]
  def change
    create_table :gates do |t|
      t.integer :index
      t.references :airport, null: false, foreign_key: true
    end
  end
end
