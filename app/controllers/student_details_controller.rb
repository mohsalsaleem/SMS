class StudentDetailsController < ApplicationController
  before_action :set_student_detail, only: [:show, :edit, :update, :destroy]

  # GET /student_details
  # GET /student_details.json
  def index
    @student_details = StudentDetail.all
  end

  # GET /student_details/1
  # GET /student_details/1.json
  def show
  end

  # GET /student_details/new
  def new
    @student_detail = StudentDetail.new
  end

  # GET /student_details/1/edit
  def edit
  end

  # POST /student_details
  # POST /student_details.json
  def create
    @student_detail = StudentDetail.new(student_detail_params)
    @student_detail.student_phone_number = "+91"+@student_detail.student_phone_number
    respond_to do |format|
      print @student_detail
      if @student_detail.save
        format.html { redirect_to @student_detail, notice: 'Student detail was successfully created.' }
        format.json { render :show, status: :created, location: @student_detail }
      else
        format.html { render :new }
        format.json { render json: @student_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_details/1
  # PATCH/PUT /student_details/1.json
  def update
    respond_to do |format|
      if @student_detail.update(student_detail_params)
        format.html { redirect_to @student_detail, notice: 'Student detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_detail }
      else
        format.html { render :edit }
        format.json { render json: @student_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_details/1
  # DELETE /student_details/1.json
  def destroy
    @student_detail.destroy
    respond_to do |format|
      format.html { redirect_to student_details_url, notice: 'Student detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_detail
      @student_detail = StudentDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_detail_params
      params.require(:student_detail).permit(:student_id, :student_name, :student_phone_number)
    end
end
