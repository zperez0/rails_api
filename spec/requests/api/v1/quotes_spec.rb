require "swagger_helper"

RSpec.describe "api/v1/quotes", type: :request do
  path "/api/v1/quotes" do
    get("list quotes") do
      response(200, "successful") do
        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true),
            },
          }
        end
        run_test!
      end
    end

    post("create quote") do
      response(200, "successful") do
        consumes "application/json"
        parameter name: :params, in: :body, schema: {
                    type: :object,
                    properties: {
                      author: { type: :string },
                      content: { type: :string },
                    }
                  }
        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true),
            },
          }
        end
        run_test!
      end
    end
  end

  path "/api/v1/quotes/{id}" do
    # You'll want to customize the parameter types...
    parameter name: "id", in: :path, type: :string, description: "id"

    get("show quote") do
      response(200, "successful") do
        let(:id) { "123" }

        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true),
            },
          }
        end
        run_test!
      end
    end

    patch("update quote") do
      response(200, "successful") do
        let(:id) { "123" }

        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true),
            },
          }
        end
        run_test!
      end
    end

    put("update quote") do
      response(200, "successful") do
        let(:id) { "123" }

        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true),
            },
          }
        end
        run_test!
      end
    end

    delete("delete quote") do
      response(200, "successful") do
        let(:id) { "123" }

        after do |example|
          example.metadata[:response][:content] = {
            "application/json" => {
              example: JSON.parse(response.body, symbolize_names: true),
            },
          }
        end
        run_test!
      end
    end
  end
end
