class CreateSurveys < ActiveRecord::Migration[8.0]
  def change
    create_table :surveys do |t|
      t.string :title
      t.string :status
      t.references :scale, null: false, foreign_key: true
      t.references :owner, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
