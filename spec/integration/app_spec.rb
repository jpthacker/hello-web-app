require "spec_helper"
require "rack/test"
require_relative "../../app"

describe Application do
    # This is so we can use rack-test helper methods.
    include Rack::Test::Methods

    # We need to declare the `app` value by instantiating the Application
    # class so our tests work.
    let(:app) { Application.new }

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
end