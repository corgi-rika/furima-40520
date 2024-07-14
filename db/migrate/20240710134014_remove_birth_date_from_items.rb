class RemoveBirthDateFromItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :birth_date, :date
  end
end
