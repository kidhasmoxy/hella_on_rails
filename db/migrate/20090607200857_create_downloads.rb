class CreateDownloads < ActiveRecord::Migration
  def self.up
    create_table :downloads do |t|
      t.string :name
      t.string :path
      t.integer :size
      t.integer :nzb_id
      t.timestamp :completed_on
      t.integer :rating
      t.text :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :downloads
  end
end
