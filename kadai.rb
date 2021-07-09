require 'webrick'
server = WEBrick::HTTPServer.new({
  :DocumentRoot => '.',
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  :Port => '3000',
})
['INT', 'TERM'].each {|signal|
  Signal.trap(signal){ server.shutdown }
}
server.mount('/', WEBrick::HTTPServlet::ERBHandler, 'kadai.html.erb')
server.mount('/form1.cgi', WEBrick::HTTPServlet::CGIHandler, 'form1.rb')
# この一行を追記
server.mount('/form2.cgi', WEBrick::HTTPServlet::CGIHandler, 'form2.rb')
server.mount('/form3.cgi', WEBrick::HTTPServlet::CGIHandler, 'form3.rb')
server.mount('/form4.cgi', WEBrick::HTTPServlet::CGIHandler, 'form4.rb')
server.mount('/form5.cgi', WEBrick::HTTPServlet::CGIHandler, 'form5.rb')
server.start