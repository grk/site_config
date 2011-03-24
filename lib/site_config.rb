module SiteConfig
  require 'site_config/settings'

  class << self
    def [](key)
      s = Settings.first(:conditions => {:key => key})
      s ? s.val : nil
    end

    def []=(key, value)
      s = Settings.find_or_create_by(:key => key)
      s.val = value
      s.save!
    end

    def keys
      Settings.only(:key).all.map { |s| s.key }
    end

    def settings
      Settings.all.inject({}) { |h, s| h[s.key] = s.val; h }
    end
  end
end
