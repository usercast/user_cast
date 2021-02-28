class StreamStore
  def initialize(mutation)
    @mutation = mutation
  end

  def persist
    collection = client[:mutations]
    collection.insert_one(@mutation)
  end

  private

  def client
    @_client ||= Mongo::Client.new(
      [ '127.0.0.1:27017' ],
      :database => "user_cast_#{Rails.env}"
    )
  end
end
