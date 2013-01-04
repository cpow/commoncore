class LessonPlansController < ApplicationController
  before_filter :authenticate_user!

  # GET /lesson_plans
  # GET /lesson_plans.json
  def index
    @lesson_plans = current_user.lesson_plans

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lesson_plans }
    end
  end

  # GET /lesson_plans/1
  # GET /lesson_plans/1.json
  def show
    @lesson_plan = current_user.lesson_plans.detect{params[:id]}

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lesson_plan }
    end
  end

  # GET /lesson_plans/new
  # GET /lesson_plans/new.json
  def new
    @lesson_plan = LessonPlan.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lesson_plan }
    end
  end

  # GET /lesson_plans/1/edit
  def edit
    @lesson_plan = current_user.lesson_plans.detect{params[:id]}
  end

  # POST /lesson_plans
  # POST /lesson_plans.json
  def create
    @lesson_plan = current_user.lesson_plans.build(params[:lesson_plan])

    respond_to do |format|
      if @lesson_plan.save
        format.html { redirect_to @lesson_plan, notice: 'Lesson plan was successfully created.' }
        format.json { render json: @lesson_plan, status: :created, location: @lesson_plan }
      else
        format.html { render action: "new" }
        format.json { render json: @lesson_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lesson_plans/1
  # PUT /lesson_plans/1.json
  def update
    @lesson_plan = current_user.lesson_plans.detect{params[:id]}

    respond_to do |format|
      if @lesson_plan.update_attributes(params[:lesson_plan])
        format.html { redirect_to @lesson_plan, notice: 'Lesson plan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lesson_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lesson_plans/1
  # DELETE /lesson_plans/1.json
  def destroy
    @lesson_plan = current_user.lesson_plans.detect{params[:id]}
    @lesson_plan.destroy

    respond_to do |format|
      format.html { redirect_to lesson_plans_url }
      format.json { head :no_content }
    end
  end
end