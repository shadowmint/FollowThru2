class VPaymentTypesController < ApplicationController
  # GET /v_payment_types
  # GET /v_payment_types.json
  def index
    @v_payment_types = VPaymentType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @v_payment_types }
    end
  end

  # GET /v_payment_types/1
  # GET /v_payment_types/1.json
  def show
    @v_payment_type = VPaymentType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @v_payment_type }
    end
  end

  # GET /v_payment_types/new
  # GET /v_payment_types/new.json
  def new
    @v_payment_type = VPaymentType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @v_payment_type }
    end
  end

  # GET /v_payment_types/1/edit
  def edit
    @v_payment_type = VPaymentType.find(params[:id])
  end

  # POST /v_payment_types
  # POST /v_payment_types.json
  def create
    @v_payment_type = VPaymentType.new(params[:v_payment_type])

    respond_to do |format|
      if @v_payment_type.save
        format.html { redirect_to @v_payment_type, notice: 'V payment type was successfully created.' }
        format.json { render json: @v_payment_type, status: :created, location: @v_payment_type }
      else
        format.html { render action: "new" }
        format.json { render json: @v_payment_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /v_payment_types/1
  # PUT /v_payment_types/1.json
  def update
    @v_payment_type = VPaymentType.find(params[:id])

    respond_to do |format|
      if @v_payment_type.update_attributes(params[:v_payment_type])
        format.html { redirect_to @v_payment_type, notice: 'V payment type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @v_payment_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /v_payment_types/1
  # DELETE /v_payment_types/1.json
  def destroy
    @v_payment_type = VPaymentType.find(params[:id])
    @v_payment_type.destroy

    respond_to do |format|
      format.html { redirect_to v_payment_types_url }
      format.json { head :no_content }
    end
  end
end
