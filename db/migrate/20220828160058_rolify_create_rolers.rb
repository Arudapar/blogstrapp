class RolifyCreateRolers < ActiveRecord::Migration[6.1]
  def change
    create_table(:rolers) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:users_rolers, :id => false) do |t|
      t.references :user
      t.references :roler
    end
    
    add_index(:rolers, :name)
    add_index(:rolers, [ :name, :resource_type, :resource_id ])
    add_index(:users_rolers, [ :user_id, :roler_id ])
  end
end
