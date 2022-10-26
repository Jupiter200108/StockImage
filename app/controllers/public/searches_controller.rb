class Public::SearchesController < ApplicationController
	def search
		@range = params[:model]
		@ward = params[:word]

    @items = Item.looks(params[:search], params[:word]).page(params[:page]).per(40)
	end

end
