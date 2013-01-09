require 'repo/ProjectRepo.rb'

class VProjectsController < ApplicationController
  # GET /v_projects
  # GET /v_projects.json
  def index
    repo = ProjectRepo.new current_user
    @v_projects = repo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @v_projects }
    end
  end

  # GET /v_projects/1
  # GET /v_projects/1.json
  def show
    repo = ProjectRepo.new current_user
    @v_project = repo.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @v_project }
    end
  end

  # GET /v_projects/new.json
  def new
    repo = ProjectRepo.new current_user
    @v_project = repo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @v_project }
    end
  end

  # GET /v_projects/1/edit
  def edit
    repo = ProjectRepo.new current_user
    @v_project = repo.get(params[:id])
  end

  # POST /v_projects
  # POST /v_projects.json
  def create
    repo = ProjectRepo.new current_user
    project = VProject.create(params[:v_project])
    @v_project = repo.create(project)

    respond_to do |format|
      if @v_project.save
        format.html { redirect_to @v_project, notice: 'V project was successfully created.' }
        format.json { render json: @v_project, status: :created, location: @v_project }
      else
        format.html { render action: "new" }
        format.json { render json: @v_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /v_projects/1
  # PUT /v_projects/1.json
  def update
    repo = ProjectRepo.new current_user
    @v_project = VProject.new(params[:v_project])

    respond_to do |format|
    if (repo.update(params[:id], @v_project))
        format.html { redirect_to @v_project, notice: 'V project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @v_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /v_projects/1
  # DELETE /v_projects/1.json
  def destroy
    repo = ProjectRepo.new current_user
    repo.destroy params[:id]

    respond_to do |format|
      format.html { redirect_to v_projects_url }
      format.json { head :no_content }
    end
  end
end
