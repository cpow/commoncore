class CoreStandardsController < ApplicationController
  before_filter :authenticate_user!

  def specific_core_standard
    @core_standards = CoreStandard.with_level_and_subject(params[:level], params[:subject])

    respond_to do |format|
      format.js {render json: @core_standards}
    end
  end

  def core_standard_from_dot_notation
    @core_standard = CoreStandard.where(dot_notation: params[:dot_notation]).first

    respond_to do |format|
      format.js {render json: @core_standard}
    end
  end
end