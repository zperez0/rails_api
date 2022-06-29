module Api
  module V2
    class QuotesController < ApplicationController
      def index
        @quotes = Quote.all.paginate(page: params[:page], per_page: 10)
        json_response(@quotes)
      end

      # def index
      #   name = params[:name]
      #   # binding.pry
      #   @quotes = Quote.search(name)
      #   json_response(@quotes)
      # end

      def show
        @quote = Quote.find(params[:id])
        json_response(@quote)
      end

      def create
        @quote = Quote.create!(quote_params)
        json_response(@quote, :created)
        # :created provides a more specific HTTP status code: 201 created
      end

      def update
        @quote = Quote.find(params[:id])
        if @quote.update!(quote_params)
          render status: 200, json: {
                   message: "This quote has been updated successfully.",
                 }
        end
      end

      def destroy
        @quote = Quote.find(params[:id])
        if @quote.destroy!
          render status: 202, json: {
                   message: "This quote has been successfully deleted.",
                 }
        end
      end

      private

      def quote_params
        params.permit(:author, :content)
      end
    end
  end
end
