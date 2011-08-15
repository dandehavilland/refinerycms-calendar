require 'event_extensions'

class TranslateEventTable < ActiveRecord::Migration
  def self.up
    Event.create_translation_table!({
      :title => :string,
      :description => :text,
      :subtitle => :string
    }, {
      :migrate_data => true
    })
    Slug.update_all(:locale => ::I18n.locale)
  end

  def self.down
    Event.drop_translation_table! :migrate_data => true
  end
end
