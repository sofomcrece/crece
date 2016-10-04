class ViewCreditsController < ApplicationController
   before_action :set_credit, only: [:show, :edit, :update, :destroy,:aprobar]
  def index
    @credits = Credit.all
  end

  # GET /credits/1
  # GET /credits/1.json
  def show
  end
 def set_credit
      @credit = Credit.find(params[:id])
 end

end
