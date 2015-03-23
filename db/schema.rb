# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150323164238) do

  create_table "assembly_lines", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inventories", force: true do |t|
    t.string   "name"
    t.string   "group",      default: ""
    t.integer  "stock",      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lines", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "simulations", force: true do |t|
    t.integer  "elapsed_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "assembly_line_id"
  end

  add_index "simulations", ["assembly_line_id"], name: "index_simulations_on_assembly_line_id", using: :btree

  create_table "station_results", force: true do |t|
    t.integer  "elapsed_time"
    t.integer  "delay_time"
    t.integer  "simulation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "station_id"
  end

  add_index "station_results", ["simulation_id"], name: "index_station_results_on_simulation_id", using: :btree
  add_index "station_results", ["station_id"], name: "index_station_results_on_station_id", using: :btree

  create_table "stations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "estimated_time"
    t.integer  "assembly_line_id"
  end

  add_index "stations", ["assembly_line_id"], name: "index_stations_on_assembly_line_id", using: :btree

end
