class Course < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' }, 
    { id: 2, name: 'カット、シャンプー、シェービング、肩マッサージ (60分) 3000円' },
    { id: 3, name: 'シェービングのみ (30分) 1500円' },
    { id: 4, name: '通常カットコースに 白髪染め追加 (90分) 5800円' },
    { id: 5, name: '通常カットコースに アイロン[ポイント]追加 (90分) 4500円' },
    { id: 6, name: '通常カットコースに アイロン[全体]追加 (120分) 5500円' },
    { id: 7, name: '通常カットコースに パーマ追加 (180分) 6800円' }
  ]

  include ActiveHash::Associations
  has_many :events
  end