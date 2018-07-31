describe 'The Web App' do
  include Rack::Test::Methods

  def app 
    Sinatra::Application
  end 
  
  context "GET to /" do
    def fake_class(board) 
      double(new: double(execute: {board: board}))
    end

    let(:response) {get '/'}
    it 'can return response status' do
      stub_const("ViewBoard", fake_class([[nil, nil, nil], [nil,nil, nil], [nil, nil, nil]]))
      expect(response.status).to eq(200)
    end 
 end 
end



