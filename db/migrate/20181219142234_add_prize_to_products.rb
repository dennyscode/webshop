class AddPrizeToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :prize, :decimal
  end
end
