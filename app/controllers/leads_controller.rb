class LeadsController < ApplicationController

  def new
    @lead = Lead.new
    @lead.lead_type ||= params[:lead_type]
  end

  def create
    @lead = Lead.new(params[:lead])

    respond_to do |format|
      if @lead.save
        format.js {}
        format.html { redirect_to root_path, notice: 'Thank you for signing up for the classAct beta! We will be emailing you shortly when its ready.' }
        format.json { render json: @lesson_plan, status: :created, location: @lesson_plan }
      else
        format.html { render action: "new" }
        format.json { render json: @lesson_plan.errors, status: :unprocessable_entity }
      end
    end
  end
end
