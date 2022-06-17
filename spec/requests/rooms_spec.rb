

require 'rails_helper'

RSpec.describe 'Rooms', type: :request do
    describe 'GET /index' do
        before(:all) do
        create_list(:room, 2)
        end

        it 'show all rooms' do
        get '/rooms'
        expect(response).to have_http_status(:ok)
        end
    end

    describe 'POST /rooms' do
        context 'Cadastrar Sala' do
        it 'Erro - Parametros para criação invalidos' do
            post '/rooms', params: invalid_params
            expect(response).to have_http_status(422)
        end

        it 'Sala Cadastrada' do
            post '/rooms', params: valid_params
            expect(response).to have_http_status(201)
        end
    end

    describe 'DELETE /rooms' do
        let!(:room) { create(:room) }
    
        context 'Deletar Sala' do
          it 'ERRO - Parametros não válidos' do
            delete '/rooms/404'
            expect(response).to have_http_status(404)
          end
    
          it 'Sala Deletada' do
            expect do
              delete "/rooms/#{room.id}"
            end.to change { room.count }.by(-1)
    
            expect(response).to have_http_status(:ok)
          end
        end
    end  
end
