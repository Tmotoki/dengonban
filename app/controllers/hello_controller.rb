class HelloController < ApplicationController
  def index
    @header = 'layouts sample'
    @footer = 'copyright SYODA-Tunayo 2016'
    @title = 'new layouts'
    @msg = 'this is a sample page!'
  end
end
