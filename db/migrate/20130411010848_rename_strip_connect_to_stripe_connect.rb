class RenameStripConnectToStripeConnect < ActiveRecord::Migration
  def change
    rename_table :strip_connects, :stripe_connects
  end
end
