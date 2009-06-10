class HellaserversController < ApplicationController
  def index
    @hellaservers = Hellaserver.find(:all)

    respond_to do |format|
      format.html
      format.xml  { render :xml => @hellaservers }
    end
  end

  def show
    @hellaserver = Hellaserver.find(params[:id])
    @status = @hellaserver.call('status')
    @queue = @status['currently_downloading'] + @status["queued"]
    @processing = @status["currently_processing"]
    @log = @status["log_entries"]
    @downloading = @status["currently_downloading"]
    
    respond_to do |format|
      format.html
      format.xml  { render :xml => @hellaserver }
    end
  end

  def new
    @hellaserver = Hellaserver.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @hellaserver }
    end
  end

  def edit
    @hellaserver = Hellaserver.find(params[:id])
  end

  def create
    @hellaserver = Hellaserver.new(params[:hellaserver])

    respond_to do |format|
      if @hellaserver.save
        flash[:notice] = 'Hellaserver was successfully created.'
        format.html { redirect_to(@hellaserver) }
        format.xml  { render :xml => @hellaserver, :status => :created, :location => @hellaserver }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @hellaserver.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @hellaserver = Hellaserver.find(params[:id])

    respond_to do |format|
      if @hellaserver.update_attributes(params[:hellaserver])
        flash[:notice] = 'Hellaserver was successfully updated.'
        format.html { redirect_to(@hellaserver) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @hellaserver.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @hellaserver = Hellaserver.find(params[:id])
    @hellaserver.destroy

    respond_to do |format|
      format.html { redirect_to(hellaservers_url) }
      format.xml  { head :ok }
    end
  end
  
  def update_queue
    newqueue = params['server-queue-list'.intern]
    hellaserver = Hellaserver.find(params[:id])
    hellaserver.call('force',newqueue[0])
    1.upto((newqueue.length - 1)) do |i|
      hellaserver.call('move',newqueue[i], i)
    end
    
    status = hellaserver.call('status')
    queue = status['currently_downloading'] + status["queued"]
    downloading = status["currently_downloading"]
    
    respond_to do |format|
      format.js {
        render :update do |page|
          page.replace_html 'server-queue-list', 
            render(:partial => 'queue', :locals => {:downloading => downloading, :queue => queue, :status => status})
          page.replace_html 'sortable-code',
           sortable_element("server-queue-list", :containment => "server-queue-list", :url => update_queue_hellaserver_url(hellaserver))
        end 
      }
    end
  end
  
end
