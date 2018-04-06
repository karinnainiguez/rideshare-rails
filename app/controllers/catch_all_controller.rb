class CatchAllController < ApplicationController
  def index
    flash.notice = 'no page found at that address'
  end
end
