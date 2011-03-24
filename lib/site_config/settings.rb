require "mongoid"

module SiteConfig
  class Settings
    include Mongoid::Document

    field :key
    field :val

    validates_uniqueness_of :key
    validates_presence_of :key

    index :key, :unique => true
  end
end
