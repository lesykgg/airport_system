# frozen_string_literal: true

class ChangeFlights < ActiveRecord::Migration[6.0]
  def change
    remove_column :flights, :from, :string
    remove_column :flights, :destination, :string

    add_reference :flights, :from, foreign_key: { to_table: :airports }
    add_reference :flights, :destination, foreign_key: { to_table: :airports }
    add_reference :flights, :gate, foreign_key: true
  end
end
