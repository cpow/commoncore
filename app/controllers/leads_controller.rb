class LeadsController < ApplicationController
  def create
    @lead = Lead.new(params[:lead])

    respond_to do |format|
      if @lead.save
        format.js {}
      else
      end
    end
  end
end
