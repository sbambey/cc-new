class AddJobTypeToFlies < ActiveRecord::Migration
  def change
    add_column :flies, :job_type, :string
  end
end
