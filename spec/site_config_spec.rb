require 'spec_helper'

describe SiteConfig do
  it "should be valid" do
    SiteConfig.should be_a(Module)
  end

  describe "key-value API" do
    it "returns empty hash for empty settings" do
      s = SiteConfig.settings
      s.should be_a(Hash)
      s.should be_empty
    end
    
    it "returns nil for missing keys" do
      SiteConfig[:missing_key].should be_nil
    end
  
    it "stores the value for new key" do
      SiteConfig[:new_key] = "new value"
      s = SiteConfig::Settings.first(:conditions => {:key => :new_key})
      s.should_not be_nil
      s.val.should be_eql("new value")
    end

    it "overwrites the value for existing key" do
      SiteConfig[:existing_key] = "old value"
      SiteConfig[:existing_key] = "new value"
      SiteConfig::Settings.where(:key => :existing_key).count.should be_eql(1)
      s = SiteConfig::Settings.first(:conditions => {:key => :existing_key})
      s.should_not be_nil
      s.val.should be_eql("new value")
    end

    it "#settings returns a hash of all settings" do
      SiteConfig[:key_one] = "value one"
      SiteConfig[:key_two] = "value two"
      SiteConfig.settings.should be_eql({:key_one => "value one", :key_two => "value two"})
    end
  end
end
