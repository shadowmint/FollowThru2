class VPledgeTypesController < ApplicationController
  # GET /v_pledge_types
  # GET /v_pledge_types.json
  def index
    @v_pledge_types = VPledgeType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @v_pledge_types }
    end
  end

  # GET /v_pledge_types/1
  # GET /v_pledge_types/1.json
  def show
    @v_pledge_type = VPledgeType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @v_pledge_type }
    end
  end

  # GET /v_pledge_types/new
  # GET /v_pledge_types/new.json
  def new
    @v_pledge_type = VPledgeType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @v_pledge_type }
    end
  end

  # GET /v_pledge_types/1/edit
  def edit
    @v_pledge_type = VPledgeType.find(params[:id])
  end

  # POST /v_pledge_types
  # POST /v_pledge_types.json
  def create
    @v_pledge_type = VPledgeType.new(params[:v_pledge_type])

    respond_to do |format|
      if @v_pledge_type.save
        format.html { redirect_to @v_pledge_type, notice: 'V pledge type was successfully created.' }
        format.json { render json: @v_pledge_type, status: :created, location: @v_pledge_type }
      else
        format.html { render action: "new" }
        format.json { render json: @v_pledge_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /v_pledge_types/1
  # PUT /v_pledge_types/1.json
  def update
    @v_pledge_type = VPledgeType.find(params[:id])

    respond_to do |format|
      if @v_pledge_type.update_attributes(params[:v_pledge_type])
        format.html { redirect_to @v_pledge_type, notice: 'V pledge type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @v_pledge_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /v_pledge_types/1
  # DELETE /v_pledge_types/1.json
  def destroy
    @v_pledge_type = VPledgeType.find(params[:id])
    @v_pledge_type.destroy

    respond_to do |format|
      format.html { redirect_to v_pledge_types_url }
      format.json { head :no_content }
    end
  end
end
