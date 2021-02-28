class StreamsController < ApplicationController
  # https://stackoverflow.com/questions/17858178/allow-anything-through-cors-policy
  #https://www.moesif.com/blog/technical/cors/Authoritative-Guide-to-CORS-Cross-Origin-Resource-Sharing-for-REST-APIs/


  skip_before_action :verify_authenticity_token

  def create
    # authenticate with origin header and registered origin
    store = StreamStore.new(Oj.load(request.body))
    store.persist
  end
end
