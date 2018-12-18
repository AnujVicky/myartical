    class Api::V1::ArticalController < ApplicationController
      protect_from_forgery prepend: true
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

      def update
        @artical = Artical.find(params[:id])
        if @artical.update_attributes(artical_params)
          render json: {status: "SUCCESS", message: "Updated Artical Successfully", data:@artical}, status: :ok
        else
          render json: {status: "SUCCESS", message: "Failed to Update artical", data:@artical.error}, status: :Failed
      end
    end

    def destroy
      @artical= Artical.find(params[:id])
      @artical.destroy
      render json: {status: "SUCCESS", message: "Deleted Artical Successfully", data:@artical}, status: :ok
    end

      private

      def artical_params
        params.permit(:title, :body)
      end

    end
