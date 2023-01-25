class Book < ApplicationRecord
    belongs_to :user
    
    # バリデーション実装
    validates :title, presence: true
    validates :body, presence: true, length: { maximum: 200 }
end
