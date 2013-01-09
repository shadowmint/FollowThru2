class VGoalsController < ApplicationController
  # GET /v_goals
  # GET /v_goals.json
  def index
    @v_goals = VGoal.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @v_goals }
    end
  end

  # GET /v_goals/1
  # GET /v_goals/1.json
  def show
    @v_goal = VGoal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @v_goal }
    end
  end

  # GET /v_goals/new
  # GET /v_goals/new.json
  def new
    @v_goal = VGoal.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @v_goal }
    end
  end

  # GET /v_goals/1/edit
  def edit
    @v_goal = VGoal.find(params[:id])
  end

  # POST /v_goals
  # POST /v_goals.json
  def create
    @v_goal = VGoal.new(params[:v_goal])

    respond_to do |format|
      if @v_goal.save
        format.html { redirect_to @v_goal, notice: 'V goal was successfully created.' }
        format.json { render json: @v_goal, status: :created, location: @v_goal }
      else
        format.html { render action: "new" }
        format.json { render json: @v_goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /v_goals/1
  # PUT /v_goals/1.json
  def update
    @v_goal = VGoal.find(params[:id])

    respond_to do |format|
      if @v_goal.update_attributes(params[:v_goal])
        format.html { redirect_to @v_goal, notice: 'V goal was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @v_goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /v_goals/1
  # DELETE /v_goals/1.json
  def destroy
    @v_goal = VGoal.find(params[:id])
    @v_goal.destroy

    respond_to do |format|
      format.html { redirect_to v_goals_url }
      format.json { head :no_content }
    end
  end
end
