class AddEmailToTrainers < ActiveRecord::Migration[7.0]
  def change
    add_column :trainers, :email, :string
  end
end
