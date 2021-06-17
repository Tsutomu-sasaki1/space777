class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: 'カテゴリー選択' },
    { id: "ジャンルは問わない", name: 'ジャンルは問わない' },
    { id: "絵画", name: '絵画' },
    { id: "造形", name: '造形' },
    { id: "写真", name: '写真' },
    { id: "映像", name: '映像' },
    { id: "音楽", name: '音楽' },
    { id: "工作", name: '工作' },
    { id: "その為１", name: 'その他１' },
    { id: "その他２", name: 'その他２' },
    { id: "その他３", name: 'その他３' }
  ]
  include ActiveHash::Associations
  has_many :posts
  has_many :users
end
