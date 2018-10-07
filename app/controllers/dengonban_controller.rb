class DengonbanController < ApplicationController
  layout "dengonban"

  def initialize
    super
    begin
      @dengon_data = JSON.parse(File.read("data.txt"))
    rescue
      @dengon_data = Hash.new
    end
    @dengon_data.each do |key,obj|
      if Time.now.to_i - key.to_i > 24*60*60 then
        @dengon_data.delete(key)
      end
      File.write("data.txt", @dengon_data.to_json)
  end

  def index
    if request.post? then
      obj = MyData.new(msg: params['msg'], name: params['name'],mail: params['mail'])
      @dengon_data[Time.now.to_i] = obj #MyDataクラスのインスタンスを作成日時に基づいて@dengon_dataに保存
      data = @dengon_data.to_json #@dengon_dataをjson形式でdataとして保存
      File.write("data.txt",data) #dataをテキストファイルとして保存
      @dengon_data = JSON.parse(data) #json形式のデータからrubyオブジェクトを生成(ruby)
    end
  end
end

class MyData
  attr_accessor :name
  attr_accessor :mail
  attr_accessor :msg

  def initialize msg:msg, name:name, mail:mail
    self.name = name
    self.mail = mail
    self.msg = msg
  end
end
end

