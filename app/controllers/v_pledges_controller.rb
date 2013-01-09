class VPledgesController < ApplicationController
  # GET /v_pledges
  # GET /v_pledges.json
  def index
    @v_pledges = VPledge.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @v_pledges }
    end
  end

  # GET /v_pledges/1
  # GET /v_pledges/1.json
  def show
    @v_pledge = VPledge.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @v_pledge }
    end
  end

  # GET /v_pledges/new
  # GET /v_pledges/new.json
  def new
    @v_pledge = VPledge.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @v_pledge }
    end
  end

  # GET /v_pledges/1/edit
  def edit
    @v_pledge = VPledge.find(params[:id])
  end

  # POST /v_pledges
  # POST /v_pledges.json
  def create
    @v_pledge = VPledge.new(params[:v_pledge])

    respond_to do |format|
      if @v_pledge.save
        format.html { redirect_to @v_pledge, notice: 'V pledge was successfully created.' }
        format.json { render json: @v_pledge, status: :created, location: @v_pledge }
      else
        format.html { render action: "new" }
        format.json { render json: @v_pledge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /v_pledges/1
  # PUT /v_pledges/1.json
  def update
    @v_pledge = VPledge.find(params[:id])

    respond_to do |format|
      if @v_pledge.update_attributes(params[:v_pledge])
        format.html { redirect_to @v_pledge, notice: 'V pledge was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @v_pledge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /v_pledges/1
  # DELETE /v_pledges/1.json
  def destroy
    @v_pledge = VPledge.find(params[:id])
    @v_pledge.destroy

    respond_to do |format|
      format.html { redirect_to v_pledges_url }
      format.json { head :no_content }
    end
  end
end
