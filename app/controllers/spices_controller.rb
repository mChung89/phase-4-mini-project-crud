class SpicesController < ApplicationController
    wrap_parameters format: []
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        render json: Spice.all
    end

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    def update
        spice = Spice.find(params[:id])
        spice.update(spice_params)
        render json: spice
    end

    def destroy
        Spice.find(params[:id]).destroy
        head :no_content
    end

    private

    def spice_params
        params.permit(:title,:image,:description,:notes,:rating)
    end

    def render_not_found_response
        render json: { error: "Spice not found" }, status: :not_found
      end
end
