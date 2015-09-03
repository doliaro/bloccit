class AddSummaryToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :summary, index: true, foreign_key: true
  end
end
