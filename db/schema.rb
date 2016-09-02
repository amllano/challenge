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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160902144053) do

  create_table "games", force: :cascade do |t|
    t.text     "status"
    t.boolean  "turn"
    t.string   "player"
    t.integer  "opponent_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["opponent_id"], name: "index_games_on_opponent_id"
  end

  create_table "guesses", force: :cascade do |t|
    t.integer  "x"
    t.integer  "y"
    t.string   "status"
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_guesses_on_game_id"
  end

  create_table "ships", force: :cascade do |t|
    t.string   "name"
    t.text     "status"
    t.integer  "size"
    t.integer  "origin_x"
    t.integer  "origin_y"
    t.string   "orientation"
    t.integer  "game_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["game_id"], name: "index_ships_on_game_id"
  end

end
