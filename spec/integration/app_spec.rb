require "spec_helper"
require "rack/test"
require_relative "../../app"

describe Application do
    # This is so we can use rack-test helper methods.
    include Rack::Test::Methods

    # We need to declare the `app` value by instantiating the Application
    # class so our tests work.
    let(:app) { Application.new }

    context "GET /hello" do
        it "returns the correct html" do
            response = get('/hello')
            expect(response.status).to eq 200
            expect(response.body).to include('<head></head>')
            expect(response.body).to include('<h1>Hello!</h1>')
        end
    end

    context "GET /names" do
        it "returns 'Julia, Mary, Karim'" do
            response = get("/names?names=Julia,Mary,Karim")
            expect(response.status).to eq 200
            expect(response.body).to eq 'Julia, Mary, Karim'
        end

        it "returns 'Harold, Jack, Sam'" do
            response = get("/names?names=Harold,Jack,Sam")
            expect(response.status).to eq 200
            expect(response.body).to eq 'Harold, Jack, Sam'
        end
    end
    context 'POST /sort-names' do
        it 'returns "Alice,Joe,Julia,Kieran,Zoe"' do
            response = post('/sort-names', :names => 'Joe,Alice,Zoe,Julia,Kieran')
            expect(response.status).to eq 200
            expect(response.body).to eq 'Alice,Joe,Julia,Kieran,Zoe'
        end

        it 'returns "Harold,Jack,Sam"' do
            response = post('/sort-names', :names => 'Sam,Harold,Jack')
            expect(response.status).to eq 200
            expect(response.body).to eq 'Harold,Jack,Sam'
        end
    end
end