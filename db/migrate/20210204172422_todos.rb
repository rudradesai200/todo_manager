class Todos < ActiveRecord::Migration[6.1]
  def change
  end

  def self.up
    create_table :todos do |t|
      t.column :todo_text, :string, :limit => 32, :null => false
      t.column :due_date, :timestamp, :null => true
      t.column :completed, :bool, :default => false
    end
  end

  def self.down
    drop_table :todos
  end
end
