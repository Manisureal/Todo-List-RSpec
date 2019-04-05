class CreateTodoListItems < ActiveRecord::Migration[5.2]
  def change
    create_table :todo_list_items do |t|
      t.text :description
      t.boolean :completed, default: false
      t.references :todo_list, foreign_key: true

      t.timestamps
    end
  end
end
