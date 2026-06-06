class CreateApplicationTables < ActiveRecord::Migration[8.1]
  def change
    create_table "contact_inquiries" do |t|
      t.string  "name",         limit: 100, null: false
      t.string  "email",        limit: 100, null: false
      t.string  "organization", limit: 250
      t.text    "message"
      t.boolean "email_sent",   default: false
      t.timestamps null: false
    end

    create_table "daily_email_stats" do |t|
      t.date    "stat_date",       null: false
      t.integer "contact_count",   default: 0, null: false
      t.integer "donation_count",  default: 0, null: false
      t.integer "sponsor_count",   default: 0, null: false
      t.integer "trainee_count",   default: 0, null: false
      t.timestamps null: false
    end
    add_index "daily_email_stats", ["stat_date"], name: "index_daily_email_stats_on_stat_date", unique: true

    create_table "donation_inquiries" do |t|
      t.string  "name",           limit: 100, null: false
      t.string  "email",          limit: 100, null: false
      t.string  "contact_number", limit: 15,  null: false
      t.text    "remarks"
      t.boolean "email_sent",     default: false
      t.string  "organization",   limit: 250
      t.timestamps null: false
    end

    create_table "sponsor_inquiries" do |t|
      t.string  "name",               limit: 100, null: false
      t.string  "email",              limit: 100, null: false
      t.integer "donation_type"
      t.string  "contact_number",     limit: 15,  null: false
      t.text    "remarks"
      t.boolean "email_sent",         default: false
      t.text    "donation_type_text"
      t.timestamps null: false
    end

    create_table "table_donation_inquiries" do |t|
      t.string "name",           limit: 100, null: false
      t.string "email",          limit: 100, null: false
      t.string "contact_number", limit: 15,  null: false
      t.text   "remarks"
      t.timestamps null: false
    end

    create_table "table_sponsor_inquiries" do |t|
      t.string  "name",           limit: 100, null: false
      t.string  "email",          limit: 100, null: false
      t.integer "donation_type",  null: false
      t.string  "contact_number", limit: 15,  null: false
      t.text    "remarks"
      t.timestamps null: false
    end

    create_table "table_trainee_inquiries" do |t|
      t.string "first_name",     limit: 100, null: false
      t.string "last_name",      limit: 100, null: false
      t.string "email",          limit: 100, null: false
      t.string "contact_number", limit: 15,  null: false
      t.text   "remarks"
      t.timestamps null: false
    end

    create_table "trainee_inquiries" do |t|
      t.string  "first_name",     limit: 100, null: false
      t.string  "last_name",      limit: 100, null: false
      t.string  "email",          limit: 100, null: false
      t.string  "contact_number", limit: 15,  null: false
      t.text    "remarks"
      t.boolean "email_sent",     default: false
      t.timestamps null: false
    end
  end
end
