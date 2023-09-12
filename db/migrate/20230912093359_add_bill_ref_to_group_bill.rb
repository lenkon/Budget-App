class AddBillRefToGroupBill < ActiveRecord::Migration[7.0]
  def change
    add_reference :group_bills, :bill, null: false, foreign_key: true
  end
end
