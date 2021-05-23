class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.integer :comment_id
      t.integer :member_id
      t.text :content
      t.integer :likecount

      t.timestamps
    end
  end
end
