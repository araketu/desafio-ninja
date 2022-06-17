require 'rails_helper'

RSpec.describe 'Meetings', type: :request do
  describe 'GET /index' do
    let(:room) { create(:room) }
    let!(:meeting_one) do
      create(:meeting, starts_at: DateTime.parse('2022-06-17 08:00:00'), ends_at: DateTime.parse('2022-06-17 9:00:00'), room: room)
    end
    let!(:meeting_two) do
      create(:meeting, starts_at: DateTime.parse('2022-06-17 09:00:00'), ends_at: DateTime.parse('2022-06-17 10:00:00'), room: room)
    end
    let!(:meeting_three) { create(:meeting) }

    context 'Reuniões Agendadas' do
      it do
        get '/meetings'
        expect(response).to have_http_status(:ok)
        expect(parsed_response.size).to eq(3)
      end
    end

    context 'Reuniões Agendadas por Sala' do
      it do
        get '/meetings', params: { room_id: room.id }

        expect(response).to have_http_status(:ok)
        expect(parsed_response.size).to eq(2)
      end
    end
  end

  describe 'GET /show' do
    let(:meeting) { create(:meeting) }

    context 'Reunião por ID ' do
      it 'Erro - Invalido' do
        get '/meetings/404'
        expect(response).to have_http_status(404)
      end

      it 'Reunião encontrada' do
        get "/meetings/#{meeting.id}"
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'POST /meetings' do
    let(:room) { create(:room) }
    let(:invalid_params) do
      {
        'title' => 'Reunião 3',
        'starts_at' => '2022-06-18 09:00:00',
        'ends_at' => '2022-06-18 10:00:00',
        'room_id' => room.id
      }
    end

    let(:valid_params) do
      {
        'title' => 'Reunião 4',
        'starts_at' => '2022-06-18 10:00:00',
        'ends_at' => '2022-06-18 11:00:00',
        'room_id' => room.id
      }
    end

    context 'Marcar Reunião' do
      it 'Erro - Parametros para criação invalidos' do
        post '/meetings', params: invalid_params
        expect(response).to have_http_status(422)
      end

      it 'Reunião marcada' do
        post '/meetings', params: valid_params
        expect(response).to have_http_status(201)
      end
    end
  end

  describe 'PUT /meetings' do
    let(:room) { create(:room) }
    let(:meeting) { create(:meeting) }
    let(:invalid_params) do
      {
        'title' => 'Reunião 1',
        'starts_at' => '2022-06-17 10:00:00',
        'ends_at' => '2022-06-17 12:00:00',
        'room_id' => room.id
      }
    end

    let(:valid_params) do
      {
        'title' => 'Reunião 2',
        'starts_at' => '2022-06-17 10:00:00',
        'ends_at' => '2022-06-17 11:00:00',
        'room_id' => room.id
      }
    end

    describe 'DELETE /meetings' do
        let!(:meeting) { create(:meeting) }
    
        context 'deletando uma reunião' do
          it 'ERRO - id inválido' do
            delete '/meetings/404'
            expect(response).to have_http_status(404)
          end
    
          it 'Reunião Cancelada e Excluída' do
            expect do
              delete "/meetings/#{meeting.id}"
            end.to change { Meeting.count }.by(-1)
    
            expect(response).to have_http_status(:ok)
          end
        end
      end

    context 'Editando reunião' do
      it ' ERRO - Parametros não válidos' do
        put "/meetings/#{meeting.id}", params: invalid_params
        expect(response).to have_http_status(422)
      end

      it 'Parametros validados' do
        put "/meetings/#{meeting.id}", params: valid_params
        expect(response).to have_http_status(200)
      end
    end
  end


end
