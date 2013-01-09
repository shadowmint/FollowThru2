class VPaymentsController < ApplicationController
  # GET /v_payments
  # GET /v_payments.json
  def index
    @v_payments = VPayment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @v_payments }
    end
  end

  # GET /v_payments/1
  # GET /v_payments/1.json
  def show
    @v_payment = VPayment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @v_payment }
    end
  end

  # GET /v_payments/new
  # GET /v_payments/new.json
  def new
    @v_payment = VPayment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @v_payment }
    end
  end

  # GET /v_payments/1/edit
  def edit
    @v_payment = VPayment.find(params[:id])
  end

  # POST /v_payments
  # POST /v_payments.json
  def create
    @v_payment = VPayment.new(params[:v_payment])

    respond_to do |format|
      if @v_payment.save
        format.html { redirect_to @v_payment, notice: 'V payment was successfully created.' }
        format.json { render json: @v_payment, status: :created, location: @v_payment }
      else
        format.html { render action: "new" }
        format.json { render json: @v_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /v_payments/1
  # PUT /v_payments/1.json
  def update
    @v_payment = VPayment.find(params[:id])

    respond_to do |format|
      if @v_payment.update_attributes(params[:v_payment])
        format.html { redirect_to @v_payment, notice: 'V payment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @v_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /v_payments/1
  # DELETE /v_payments/1.json
  def destroy
    @v_payment = VPayment.find(params[:id])
    @v_payment.destroy

    respond_to do |format|
      format.html { redirect_to v_payments_url }
      format.json { head :no_content }
    end
  end
end
