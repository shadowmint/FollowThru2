class VUserDataController < ApplicationController
  # GET /v_user_data
  # GET /v_user_data.json
  def index
    @v_user_data = VUserData.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @v_user_data }
    end
  end

  # GET /v_user_data/1
  # GET /v_user_data/1.json
  def show
    @v_user_datum = VUserData.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @v_user_datum }
    end
  end

  # GET /v_user_data/new
  # GET /v_user_data/new.json
  def new
    @v_user_datum = VUserData.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @v_user_datum }
    end
  end

  # GET /v_user_data/1/edit
  def edit
    @v_user_datum = VUserData.find(params[:id])
  end

  # POST /v_user_data
  # POST /v_user_data.json
  def create
    @v_user_datum = VUserData.new(params[:v_user_datum])

    respond_to do |format|
      if @v_user_datum.save
        format.html { redirect_to @v_user_datum, notice: 'V user data was successfully created.' }
        format.json { render json: @v_user_datum, status: :created, location: @v_user_datum }
      else
        format.html { render action: "new" }
        format.json { render json: @v_user_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /v_user_data/1
  # PUT /v_user_data/1.json
  def update
    @v_user_datum = VUserData.find(params[:id])

    respond_to do |format|
      if @v_user_datum.update_attributes(params[:v_user_datum])
        format.html { redirect_to @v_user_datum, notice: 'V user data was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @v_user_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /v_user_data/1
  # DELETE /v_user_data/1.json
  def destroy
    @v_user_datum = VUserData.find(params[:id])
    @v_user_datum.destroy

    respond_to do |format|
      format.html { redirect_to v_user_data_index_url }
      format.json { head :no_content }
    end
  end
end
