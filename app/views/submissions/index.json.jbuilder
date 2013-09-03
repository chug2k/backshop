json.array!(@submissions) do |submission|
  json.extract! submission, :player_id, :topic_id
  json.url submission_url(submission, format: :json)
end
