class EventsController < ApplicationController

	before_action :set_event, :only => [:show, :edit, :update, :destroy]

	def index
		@events = Event.page(params[:page]).per(10)
	end

	def new
		@event = Event.new
	end

	#post/ events/ create
	def create
		@event = Event.new(event_parms)
		if @event.save
			flash[:notice] = "新增成功"
			redirect_to :action => :index #告訴瀏覽器 HTTP code: 303
		else
			render :action => :new #new.html.erb
		end
	end




	#show data detail
	def show
		@title = @event.name
	end
    
    #get /events/edit/:id
	def edit
	end

	#get /events/update/:id
	def update
		@event.update(event_parms)
		if @event.update(event_parms)
			flash[:notice] = "編輯成功"
			redirect_to :action => :show, :id => @event
		else
			render :action => :edit
		end
	end

	def destroy 
		@event.destroy
		flash[:alert] = "刪除成功"
		redirect_to :action => :index #告訴瀏覽器 HTTP code: 303
	end

	#為了簡潔而寫的before_action fuction
	def set_event
		@event = Event.find(params[:id])
	end




	private
		def event_parms
			params.require(:event).permit(:name, :description)
		end

end
