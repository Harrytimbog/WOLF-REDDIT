class AddSummaryToCommunities < ActiveRecord::Migration[6.0]
  def change
    add_column :communities, :summary, :text
  end
end
