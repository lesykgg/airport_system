# frozen_string_literal: true

class CreateAirports < ActiveRecord::Migration[6.0]
  def change
    create_table :airports do |t|
      t.string :name
      t.string :icao
      t.string :iata
      t.string :country
    end
  end
end
