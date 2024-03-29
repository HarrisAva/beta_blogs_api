class CreateMonthlySummaries < ActiveRecord::Migration[7.1]
  def change
    create_table :monthly_summaries do |t|
      t.references :user, null: false, foreign_key: true
      t.date :month
      t.integer :total_likes

      t.timestamps
    end
  end
end
