class CreateTypeAQuestions < ActiveRecord::Migration
  def up
    create_table :type_a_questions do |t|
      t.integer "ref_pic", :null => false
      t.integer "other_pic", :null => false
      t.boolean "sticky", :null => false
      t.timestamps
    end
  end
end
