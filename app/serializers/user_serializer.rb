class UserSerializer
  include JSONAPI::Serializer
  attributes :username, :high_score, :rank
  
end
