class RoomsController < ApplicationController
    def index
      render json: Room.all
    end

    def show
        render json: @room
      end
    
      def create
        @room = Meeting.new(meeting_params)
        @room.save!
        
        render json: @room, status: :created
      end
    
    
      def destroy
        @room.destroy!
    
        head :ok
      end
    
      private
    
    
      def room_params
        params.permit(:room_id)
      end


  end