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
end
