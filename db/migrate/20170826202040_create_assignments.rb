class CreateAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :assignments do |t|
      t.references :assignable, polymorphic: true, index: true
      t.references :assignee, polymorphic: true, index: true
      
      t.timestamps
    end
  end
end
