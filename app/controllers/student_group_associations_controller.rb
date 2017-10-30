class StudentGroupAssociationsController < ApplicationController
  before_action :set_student_group_association, only: [:show, :edit, :update, :destroy]

  # GET /student_group_associations
  # GET /student_group_associations.json
  def index
    @student_group_associations = StudentGroupAssociation.all
  end

  # GET /student_group_associations/1
  # GET /student_group_associations/1.json
  def show
  end

  # GET /student_group_associations/new
  def new
    @student_group_association = StudentGroupAssociation.new
  end

  # GET /student_group_associations/1/edit
  def edit
  end

  # POST /student_group_associations
  # POST /student_group_associations.json
  def create
    @student_group_association = StudentGroupAssociation.new(student_group_association_params)

    respond_to do |format|
      if @student_group_association.save
        format.html { redirect_to @student_group_association, notice: 'Student group association was successfully created.' }
        format.json { render :show, status: :created, location: @student_group_association }
      else
        format.html { render :new }
        format.json { render json: @student_group_association.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_group_associations/1
  # PATCH/PUT /student_group_associations/1.json
  def update
    respond_to do |format|
      if @student_group_association.update(student_group_association_params)
        format.html { redirect_to @student_group_association, notice: 'Student group association was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_group_association }
      else
        format.html { render :edit }
        format.json { render json: @student_group_association.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_group_associations/1
  # DELETE /student_group_associations/1.json
  def destroy
    @student_group_association.destroy
    respond_to do |format|
      format.html { redirect_to student_group_associations_url, notice: 'Student group association was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_group_association
      @student_group_association = StudentGroupAssociation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_group_association_params
      params.require(:student_group_association).permit(:student_group_id, :user_id)
    end
end
