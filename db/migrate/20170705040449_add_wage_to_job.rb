class AddWageToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :lower_wage_bound, :integer
    add_column :jobs, :upper_wage_bound, :integer
    add_column :jobs, :contact_email, :string
  end
end
