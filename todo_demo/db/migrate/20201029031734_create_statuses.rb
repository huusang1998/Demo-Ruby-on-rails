class CreateStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :statuses do |t|
      t.boolean :status

      t.timestamps
    end
  end
end
