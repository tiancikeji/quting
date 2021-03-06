class Api::MediaController < ApplicationController
  # GET /media
  # GET /media.json
  def index
    if params[:term]
      @media = Medium.where("name like '%"+params[:term]+"%' or category like '%"+params[:term]+"%' ").page params[:page]
    else
      @media = Medium.page params[:page]
    end
    if params[:guest_id]
      @likes = Like.where(:guest_id => params[:guest_id])
      # @buys = Buy.where(:guest_id => params[:guest_id])
      
      like_ids = []
      @likes.each do |like|
        like_ids << like.medium_id
      end

      # buy_ids = []
      # @buys.each do |buy|
      #   buy_ids << buy.medium_id
      # end

      @media.each do |m|
        m.is_like = 1
      end

    end
    render :json => { :count=> Medium.all.count, :media => @media }
  end

  # GET /media/1
  # GET /media/1.json
  def show
    @medium = Medium.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medium }
    end
  end

  # GET /media/new
  # GET /media/new.json
  def new
    @medium = Medium.new
    5.times { @medium.mfiles.build }
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medium }
    end
  end

  # GET /media/1/edit
  def edit
    @medium = Medium.find(params[:id])
  end

  # POST /media
  # POST /media.json
  def create
    @medium = Medium.new(params[:medium])

    respond_to do |format|
      if @medium.save
        format.html { redirect_to @medium, notice: 'Medium was successfully created.' }
        format.json { render json: @medium, status: :created, location: @medium }
      else
        format.html { render action: "new" }
        format.json { render json: @medium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /media/1
  # PUT /media/1.json
  def update
    @medium = Medium.find(params[:id])

    respond_to do |format|
      if @medium.update_attributes(params[:medium])
        format.html { redirect_to @medium, notice: 'Medium was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /media/1
  # DELETE /media/1.json
  def destroy
    @medium = Medium.find(params[:id])
    @medium.destroy

    respond_to do |format|
      format.html { redirect_to media_url }
      format.json { head :no_content }
    end
  end
end
