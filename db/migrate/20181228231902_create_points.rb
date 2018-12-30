class CreatePoints < ActiveRecord::Migration[5.2]
  def change
    create_table :points do |t|
      t.integer :score
      t.date :score_date
      t.integer :user_id

      t.timestamps
    end
  end
end
