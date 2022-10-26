class Public::SearchesController < ApplicationController
	def search
		@range = params[:model]
		@word = params[:word]

    @items = Item.looks( params[:word]).page(params[:page]).per(40)
	end

end
