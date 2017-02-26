class LabsController < ApplicationController
  before_action :set_lab, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /labs
  # GET /labs.json
  def index
    @users = User.all
    @labs = Lab.all
    @codes = Student.all.order("code")
    @students = Student.all.order("rank")
  end

  # GET /labs/1
  # GET /labs/1.json
  def show
        unless current_user.id == 1
          redirect_to :back
        end
  end

  # GET /labs/new
  def new
        unless current_user.id == 1
          redirect_to :back
        end
    @lab = Lab.new
  end

  # GET /labs/1/edit
  def edit
    unless current_user.id == 1
      redirect_to :back
    end
  end

  # POST /labs
  # POST /labs.json
  def create
    if current_user
      @lab = Lab.new(lab_params)

      respond_to do |format|
        if @lab.save
          format.html { redirect_to @lab, notice: 'Lab was successfully created.' }
          format.json { render :show, status: :created, location: @lab }
        else
          format.html { render :new }
          format.json { render json: @lab.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /labs/1
  # PATCH/PUT /labs/1.json
  def update
    if current_user.id==1
      respond_to do |format|
        if @lab.update(lab_params)
          format.html { redirect_to @lab, notice: 'Lab was successfully updated.' }
          format.json { render :show, status: :ok, location: @lab }
        else
          format.html { render :edit }
          format.json { render json: @lab.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /labs/1
  # DELETE /labs/1.json
  def destroy
    if current_user.id==1
      @lab.destroy
      respond_to do |format|
        format.html { redirect_to labs_url, notice: 'Lab was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_lab
    @lab = Lab.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def lab_params
    params.require(:lab).permit(:name, :cap, :info)
  end
end
