class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.text :context

      t.timestamps null: false
    end
  end
end
