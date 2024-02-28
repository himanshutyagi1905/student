class StudentSerializer < ActiveModel::Serializer
  attributes :name,:abc
  def abc
    "abc"
  end

end
