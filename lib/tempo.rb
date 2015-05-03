require 'net/http'
require 'json'

load File.expand_path("../tempo/tasks/tempo.rake", __FILE__)

module Tempo
  def self.post(project: nil, token: nil, message: nil, payload: {})
    payload['agent'] = 'capistrano'

    params = {'payload' => payload.to_json}
    uri = URI(URI.encode("#{fetch(:tempo_url)}/api/v1/provider/#{project}/notify/deployer?access_token=#{token}"))

    Net::HTTP.post_form(uri, params)
  end
end
