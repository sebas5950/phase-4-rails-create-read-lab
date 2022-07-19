class PlantsController < ApplicationController
    wrap_parameters format: []

    def index
        plants = Plant.all
        render json: plants
    end

    def show
        plant = Plant.find_by(id: params[:id])
        if plant
            render json: plant, status: :ok
        else
            render json: {error: "plant not found"}, status: :not_found
        end
    end

    def create
        plant = Plant.create(strong_plant)
        render json: plant, status: :created
    end

    private

    def strong_plant
        params.permit(:name, :image, :price)
    end

end
