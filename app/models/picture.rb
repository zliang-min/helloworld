class Picture < ActiveRecord::Base
  belongs_to :attachable, :polymorphic => true

  has_attachment :content_type => :image,
    :storage => :file_system
    #resize_to => '???x???',
    #thumbnails => { :thumb => '???x???' }

  validates_as_attachment
end
