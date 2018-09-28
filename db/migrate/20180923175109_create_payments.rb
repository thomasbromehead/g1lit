class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.float :amount, precision: 7, scale: 2

      t.timestamps
    end
  end
end
