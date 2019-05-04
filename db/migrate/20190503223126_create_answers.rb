class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.text :description
      t.boolean :option, null: false, default: false
      t.references :message, foreign_key: true

      t.timestamps
    end
  end
end
