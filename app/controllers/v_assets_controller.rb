require 'repo/ProjectRepo.rb'
require 'repo/AssetRepo.rb'

class VAssetsController < ApplicationController
  

  # GET /v_assets
  # GET /v_assets.json
  def index
    repo = assets_repo
    @v_assets = repo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @v_assets }
    end
  end

  # GET /v_assets/1
  # GET /v_assets/1.json
  def show
    repo = assets_repo
    @v_asset = repo.get(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @v_asset }
    end
  end

  # GET /v_assets/new
  # GET /v_assets/new.json
  def new
    repo = assets_repo
    @v_asset = repo.new

    respond_to do |format|
      format.html new.html.erb
      format.json { render json: @v_asset }
    end
  end

  # POST /v_assets
  # POST /v_assets.json
  def create
    repo = assets_repo

    file = (params.has_key?(:file)) ? params[:file] : false
    @v_asset = repo.create file

    respond_to do |format|
      if @v_asset.save
        format.html { redirect_to @v_asset, notice: 'V asset was successfully created.' }
        format.json { render json: @v_asset, status: :created, location: @v_asset }
      else
        format.html { render action: "new" }
        format.json { render json: @v_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /v_assets/1
  # DELETE /v_assets/1.json
  def destroy
    repo = assets_repo
    repo.destroy(params[:id])

    respond_to do |format|
      format.html { redirect_to v_assets_url }
      format.json { head :no_content }
    end
  end

  ## Fetch the asset repository, assuming pid param exists.
  private
  def assets_repo
    project_repo = ProjectRepo.new current_user
    project = project_repo.find(params[:pid])
    asset_repo = AssetRepo.new current_user, project
    return asset_repo
  end
end
