class BaseSerializer < ActiveModel::Serializer
  protected

  def serialize(*args)
    ActiveModel::SerializableResource.new(*args)
  end
end
