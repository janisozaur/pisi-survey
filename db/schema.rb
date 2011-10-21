# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111015190252) do

  create_table "surveys", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "type_a_answers", :force => true do |t|
    t.integer  "type_a_question_id", :null => false
    t.integer  "survey_id",          :null => false
    t.integer  "question_id",        :null => false
    t.integer  "value",              :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "type_a_questions", :force => true do |t|
    t.integer  "ref_pic",    :null => false
    t.integer  "other_pic",  :null => false
    t.boolean  "sticky",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
