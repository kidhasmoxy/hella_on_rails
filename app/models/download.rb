class Download < ActiveRecord::Base
  belongs_to :hellaserver
  
  validates_presence_of :hellaserver
  validates_associated :hellaserver
  
  
end
