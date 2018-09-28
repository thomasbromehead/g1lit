class AddConfirmedToPayments < ActiveRecord::Migration[5.2]
  def change
    add_column :payments, :confirmed, :boolean, default: false
  end
end
