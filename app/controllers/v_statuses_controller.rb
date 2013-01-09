class VStatusesController < ApplicationController
  # GET /v_statuses
  # GET /v_statuses.json
  def index
    @v_statuses = VStatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @v_statuses }
    end
  end

  # GET /v_statuses/1
  # GET /v_statuses/1.json
  def show
    @v_status = VStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @v_status }
    end
  end

  # GET /v_statuses/new
  # GET /v_statuses/new.json
  def new
    @v_status = VStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @v_status }
    end
  end

  # GET /v_statuses/1/edit
  def edit
    @v_status = VStatus.find(params[:id])
  end

  # POST /v_statuses
  # POST /v_statuses.json
  def create
    @v_status = VStatus.new(params[:v_status])

    respond_to do |format|
      if @v_status.save
        format.html { redirect_to @v_status, notice: 'V status was successfully created.' }
        format.json { render json: @v_status, status: :created, location: @v_status }
      else
        format.html { render action: "new" }
        format.json { render json: @v_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /v_statuses/1
  # PUT /v_statuses/1.json
  def update
    @v_status = VStatus.find(params[:id])

    respond_to do |format|
      if @v_status.update_attributes(params[:v_status])
        format.html { redirect_to @v_status, notice: 'V status was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @v_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /v_statuses/1
  # DELETE /v_statuses/1.json
  def destroy
    @v_status = VStatus.find(params[:id])
    @v_status.destroy

    respond_to do |format|
      format.html { redirect_to v_statuses_url }
      format.json { head :no_content }
    end
  end
end
