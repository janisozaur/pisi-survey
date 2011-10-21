class TypeAQuestion < ActiveRecord::Base
  def ref_picture
    "%05d.png" % ref_pic
  end
  
  def other_picture
    "%05d.png" % other_pic
  end
end
