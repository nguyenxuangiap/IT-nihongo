class Post < ApplicationRecord
  belongs_to :musical_instrument
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_many :evaluation, dependent: :destroy

  has_attached_file :image, styles: {medium: "300x300>", thumb: "100x100>"},
    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  enum sound_quality: [:verybad, :bad, :normal, :good, :verygood]
  enum felling: [:villainous, :great, :awesome]
end
