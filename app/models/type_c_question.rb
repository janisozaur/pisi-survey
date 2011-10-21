class TypeCQuestion < ActiveRecord::Base
  def ref_picture
    "%05d.png" % ref_pic
  end
end