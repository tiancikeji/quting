class Api::BuysController < ApplicationController
  # GET /buys
  # GET /buys.json
  def index
    @buys = Buy.where(:guest_id => params[:guest_id])
    buy_ids = []
    @buys.each do |buy|
      buy_ids << buy.medium_id
    end
    render :json => {:buys => Medium.find_all_by_id(buy_ids.uniq)} 
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
    @buy = Buy.find(params[:id])
    @buy.destroy

    respond_to do |format|
      format.html { redirect_to buys_url }
      format.json { head :no_content }
    end
  end
end
