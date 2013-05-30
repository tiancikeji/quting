class Api::MfilesController < ApplicationController
  # GET /mfiles
  # GET /mfiles.json
  def index
    @mfiles = Mfile.where(:medium_id => params[:medium_id])
    render json: @mfiles
  end

  # GET /mfiles/1
  # GET /mfiles/1.json
  def show
    @mfile = Mfile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mfile }
    end
  end

  # GET /mfiles/new
  # GET /mfiles/new.json
  def new
    @mfile = Mfile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mfile }
    end
  end

  # GET /mfiles/1/edit
  def edit
    @mfile = Mfile.find(params[:id])
  end

  # POST /mfiles
  # POST /mfiles.json
  def create
    @mfile = Mfile.new(params[:mfile])

    respond_to do |format|
      if @mfile.save
        format.html { redirect_to @mfile, notice: 'Mfile was successfully created.' }
        format.json { render json: @mfile, status: :created, location: @mfile }
      else
        format.html { render action: "new" }
        format.json { render json: @mfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mfiles/1
  # PUT /mfiles/1.json
  def update
    @mfile = Mfile.find(params[:id])

    respond_to do |format|
      if @mfile.update_attributes(params[:mfile])
        format.html { redirect_to @mfile, notice: 'Mfile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mfiles/1
  # DELETE /mfiles/1.json
  def destroy
    @mfile = Mfile.find(params[:id])
    @mfile.destroy

    respond_to do |format|
      format.html { redirect_to mfiles_url }
      format.json { head :no_content }
    end
  end
end
