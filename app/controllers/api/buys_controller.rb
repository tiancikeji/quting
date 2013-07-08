class Api::BuysController < ApplicationController
  # GET /buys
  # GET /buys.json
  def index
    @buys = Buy.where(:guest_id => params[:guest_id])
    @likes = Like.where(:guest_id => params[:guest_id])
    like_array = []
    @likes.each do |like|
      like_array << like.medium_id
    end
    buy_ids = []
    @buys.each do |buy|
      buy_ids << buy.medium_id
    end
    @medium_buys = Medium.find_all_by_id(buy_ids.uniq)
    
    @medium_buys.each do |medium|
      if like_array.include? medium.id
        medium.is_like = 1
      end
    end

    render :json => {:buys => @medium_buys } 
  end

  # GET /buys/1
  # GET /buys/1.json
  def show
    @buy = Buy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @buy }
    end
  end

  # GET /buys/new
  # GET /buys/new.json
  def new
    @buy = Buy.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @buy }
    end
  end

  # GET /buys/1/edit
  def edit
    @buy = Buy.find(params[:id])
  end

  # POST /buys
  # POST /buys.json
  def create
    @buy = Buy.new(params[:buy])
    if @buy.save
      render :json =>{:buy => @buy}
    else
      render json: @buy.errors
    end
  end

  # PUT /buys/1
  # PUT /buys/1.json
  def update
    @buy = Buy.find(params[:id])

    respond_to do |format|
      if @buy.update_attributes(params[:buy])
        format.html { redirect_to @buy, notice: 'Buy was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @buy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buys/1
  # DELETE /buys/1.json
  def destroy
    @buy = Buy.where("guest_id= "+params[:guest_id]+ " and medium_id = "+params[:medium_id]).first
    @like = Like.where("guest_id= "+params[:guest_id]+ " and medium_id = "+params[:medium_id]).first
    if @buy
      @buy.destroy
      render :json => {:success => true}
    else
      render :json => {:success => false}
    end

  end
end
