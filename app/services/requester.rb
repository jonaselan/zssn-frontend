class Requester
  class << self
    def get(source)
      to_json(RestClient.get("#{ENV['API']}/" + source, { accept: :json }))
    end

    def post(source, params)
      RestClient.post("#{ENV['API']}/" + source, params.as_json)
    end

    def put(source, params)
      RestClient.put("#{ENV['API']}/" + source, params.as_json)
    end

    private

    def to_json(response)
      JSON.parse(response, quirks_mode: true)
    end
  end
end
