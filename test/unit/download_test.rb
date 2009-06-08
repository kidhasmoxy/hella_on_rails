require File.dirname(__FILE__) + '/../test_helper'

class DownloadTest < ActiveSupport::TestCase
  should_have_db_column :name
  should_have_db_column :path
  should_have_db_column :size
  should_have_db_column :nzb_id
  should_have_db_column :completed_on
  should_have_db_column :rating
  should_have_db_column :comment
end
