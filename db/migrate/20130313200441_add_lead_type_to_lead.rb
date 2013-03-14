class AddLeadTypeToLead < ActiveRecord::Migration
  def change
    add_column :leads, :lead_type, :string
  end
end
