class CreateOrdinaryCmsPages < ActiveRecord::Migration
  def change
    create_table :ordinary_cms_pages do |t|

      t.timestamps
    end
  end
end
