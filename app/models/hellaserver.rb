class Hellaserver < ActiveRecord::Base
  has_many :downloads
  
  validates_presence_of :uri
  
  
  # def status
  #     client = XMLRPC::Client.new2(uri)
  #     return client.call('status')
  # end
  # 
  # def current_queue
  #   client = XMLRPC::Client.new2(uri)
  #   return client.call('list')
  # end
  
  # Creates an XMLRPC client for instance uri and passes method and args to call for object
  # Should be more customized for hella, but that should go in a separate class later
  
  def call(method, *args)
    begin
      server = XMLRPC::Client.new2(uri)
      result = server.call(method, *args)
    rescue XMLRPC::FaultException => e
      puts "*** Error: #{e.faultCode} - #{e.faultString} ***"
    end
    return result
  end

end
