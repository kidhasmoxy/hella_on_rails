require File.dirname(__FILE__) + '/../test_helper'

class HellaserverTest < ActiveSupport::TestCase
  should_have_db_column :uri
  should_have_db_column :download_path
end
