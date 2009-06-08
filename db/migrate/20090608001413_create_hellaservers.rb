class CreateHellaservers < ActiveRecord::Migration
  def self.up
    create_table :hellaservers do |t|
      t.string :uri
      t.string :download_path

      t.timestamps
    end
  end

  def self.down
    drop_table :hellaservers
  end
end
