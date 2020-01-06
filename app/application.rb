class Application

  @@items = ["Apples","Carrots","Pears"]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
        item = req.path.split('/items/')[-1]
        if item = @@items.find{|e| e.name == item}
            resp.write item.price
        else
        resp.status = 400
            resp.write 'Item not found'
        end
    else
        resp.status = 404
        resp.write 'Route not found'
  end
  resp.finish
end
end
