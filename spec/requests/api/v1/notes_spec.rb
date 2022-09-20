require 'swagger_helper'

RSpec.describe 'api/v1/notes', type: :request do

  path '/api/v1/notebooks/{notebook_id}/notes' do
    # You'll want to customize the parameter types...
    parameter name: 'notebook_id', in: :path, type: :string, description: 'notebook_id'

    get('list notes') do
      response(200, 'successful') do
        let(:notebook_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create note') do
      response(200, 'successful') do
        let(:notebook_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/notebooks/{notebook_id}/notes/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'notebook_id', in: :path, type: :string, description: 'notebook_id'
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show note') do
      response(200, 'successful') do
        let(:notebook_id) { '123' }
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    patch('update note') do
      response(200, 'successful') do
        let(:notebook_id) { '123' }
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    put('update note') do
      response(200, 'successful') do
        let(:notebook_id) { '123' }
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('delete note') do
      response(200, 'successful') do
        let(:notebook_id) { '123' }
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
