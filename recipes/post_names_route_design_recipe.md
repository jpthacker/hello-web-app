# POST/sort-names Route Design Recipe

_Copy this design recipe template to test-drive a Sinatra route._

## 1. Design the Route Signature

You'll need to include:

-   the HTTP method
-   the path
-   any query parameters (passed in the URL)
-   or body parameters (passed in the request body)

HTTP method: POST
path: /sort-names
body params: :names => 'Joe,Alice,Zoe,Julia,Kieran'

## 2. Design the Response

The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return `200 OK` if the post exists, but `404 Not Found` if the post is not found in the database.

Your response might return plain text, JSON, or HTML code.

_Replace the below with your own design. Think of all the different possible responses your route will return._

```
With correct params
res.status: 200
res: # => edited params

No or incorrect params
res.status: 200
res: # => empty string
```

## 3. Examples

_Replace these with your own design._

```
# Request:
POST http://localhost:9292/sort-names

# With body parameters:
names=Joe,Alice,Zoe,Julia,Kieran

# Expected response (sorted list of names):
Alice,Joe,Julia,Kieran,Zoe

--

# Request:
POST http://localhost:9292/sort-names

# With body parameters:
names=Sam,Harold,Jack

# Expected response (sorted list of names):
Harold,Jack,Sam
```

## 4. Encode as Tests Examples

```ruby
# EXAMPLE
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
    include Rack::Test::Methods

    let(:app) { Application.new }

    context 'POST /sort-names' do
        it 'returns "Alice,Joe,Julia,Kieran,Zoe"' do
            response = post('/sort-names'), :names => 'Joe,Alice,Zoe,Julia,Kieran'
            expect(response.status).to eq 200
            expect(response.body).to eq 'Alice,Joe,Julia,Kieran,Zoe'
        end

        it 'returns "Harold,Jack,Sam"' do
            response = post('/sort-names'), :names => 'Sam,Harold,Jack'
            expect(response.status).to eq 200
            expect(response.body).to eq 'Harold,Jack,Sam'
        end
    end
end
```
