class CreateTaxRates < ActiveRecord::Migration
  def change
    create_table :tax_rates do |t|
      t.string :state
      t.string :tax_name
      t.decimal :rate, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
