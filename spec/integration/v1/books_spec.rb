require 'swagger_helper'

RSpec.describe 'api/v1/books', type: :request do
  before(:all) do
    @book = FactoryBot.create :api_book
  end

  # path '/api/v1/books' do
  #   get 'List all Books' do
  #     tags 'Books'
  #     consumes 'application/json'
  #     parameter name: :book, in: :body, schema: {
  #       type: :object,
  #       properties: {
  #         salesforce_id: { type: :string },
  #         name: { type: :string },
  #         created_at: { type: :string },
  #         updated_at: { type: :string }
  #       },
  #       required: %w[salesforce_id name]
  #     }
  #     response '200', 'books retrieved' do
  #       let(:book) { @book }
  #       run_test!
  #     end
  #   end
  # end
  #
  # path '/api/v1/books/{id}' do
  #
  #   get 'Return one book' do
  #     tags 'Books'
  #     consumes 'application/json'
  #     parameter name: :id, in: :path, type: :string
  #
  #     response '200', 'book found' do
  #       schema type: :object,
  #              properties: {
  #                salesforce_id: { type: :string },
  #                name: { type: :string },
  #                created_at: { type: :string },
  #                updated_at: { type: :string }
  #              },
  #              required: %w[salesforce_id name]
  #
  #       let(:id) { @book.id }
  #       run_test!
  #     end
  #
  #     response '404', 'book not found' do
  #       let(:id) { 25 }
  #       run_test!
  #     end
  #   end
  # end
end
