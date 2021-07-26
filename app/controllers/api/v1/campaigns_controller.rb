class Api::V1::CampaignsController < Api::V1::BaseController
  # GET /campaigns
  def index
    head(:not_found)
  end

  # GET /campaigns/:id
  def show
    @campaign = Campaign.find_by!(salesforce_id: params[:id])
    render json: @campaign, status: :ok
  end
end
