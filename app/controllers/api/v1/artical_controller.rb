    class Api::V1::ArticalController < ApplicationController
      def index
        @articals = Artical.all
        render json: {status: "SUCCESS", message: "Loaded Successfull", data:@articals}, status: :ok
      end

      def show
        @artical = Artical.find(params[:id])
        render json: {status: "SUCCESS", message: "Loaded Artical", data:@artical}, status: :ok
      end

      def create
        @artical = Artical.new(artical_params)

        if @artical.save
          render json: {status: "SUCCESS", message: "Saved Artical", data:@artical}, status: :ok
        else
          render json: {status: "SUCCESS", message: "Failed to Save artical", data:@artical.error}, status: :Failed
        end
      end

      private
      
      def artical_params
        params.permit(:title, :body)
      end

    end
