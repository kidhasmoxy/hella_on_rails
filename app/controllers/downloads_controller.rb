class DownloadsController < ApplicationController
  def index
    @downloads = Download.find(:all)

    respond_to do |format|
      format.html
      format.xml  { render :xml => @downloads }
    end
  end

  def show
    @download = Download.find(params[:id])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @download }
    end
  end

  def new
    @download = Download.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @download }
    end
  end

  def edit
    @download = Download.find(params[:id])
  end

  def create
    @download = Download.new(params[:download])

    respond_to do |format|
      if @download.save
        flash[:notice] = 'Download was successfully created.'
        format.html { redirect_to(@download) }
        format.xml  { render :xml => @download, :status => :created, :location => @download }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @download.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @download = Download.find(params[:id])

    respond_to do |format|
      if @download.update_attributes(params[:download])
        flash[:notice] = 'Download was successfully updated.'
        format.html { redirect_to(@download) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @download.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @download = Download.find(params[:id])
    @download.destroy

    respond_to do |format|
      format.html { redirect_to(downloads_url) }
      format.xml  { head :ok }
    end
  end
end
