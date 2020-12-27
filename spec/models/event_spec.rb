require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    @event = FactoryBot.build(:event)
  end
  describe '新規予約登録' do
    context '新規予約登録がうまくいくとき' do
      it 'titleとdescriptionとstart_dateとend_dateが存在していれば保存できること' do
        expect(@event).to be_valid
      end

      it 'descriptionは空でも保存できること' do
        @event.description = nil
        expect(@event).to be_valid
      end

      it 'start_dateは現在の日付以降なら保存できること' do
        @event.start_date = 
        expect(@event).to be_valid
      end
    end

    context '新規予約登録がうまくいかないとき' do
      it 'titleが空では保存できないこと' do
        @event.title = nil
        @event.valid?
        expect(@event.errors.full_messages).to include("名前を入力してください")
      end

      it 'userが紐付いていないと保存できないこと' do
        @event.user = nil
        @event.valid?
        expect(@event.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end

