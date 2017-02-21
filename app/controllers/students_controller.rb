class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /students
  # GET /students.json
  def index
    @students = Student.all
  end

  # GET /students/1
  # GET /students/1.json
  def show
    unless current_user.id == 1
      redirect_to :root
    end
  end

  # GET /students/new
  def new
    @labs = Lab.all
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
    if current_user.id != 1
      if @student.third != current_user.id
        redirect_to :back
      end
    end
      @labs = Lab.all
  end

  # POST /students
  # POST /students.json
  def create
    @labs = Lab.all
    if Student.find_by third: current_user.id
      return if current_user.id != 1
    end
    @student = Student.new(student_params)
    @student.third = current_user.id
    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    @labs = Lab.all
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    if current_user.id != 1
      if @student.third != current_user.id
        @student.destroy
        respond_to do |format|
          format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
          format.json { head :no_content }
        end
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Student.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def student_params
    params.require(:student).permit(:name, :rank, :first, :second, :third, :code)
  end
end
