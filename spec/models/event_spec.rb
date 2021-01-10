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

      it 'start_dateは現在の時間以降なら保存できること' do
        @event.start_date = Time.zone.now+ 60 * 60
        expect(@event).to be_valid
      end

      it 'end_dateはstart_date以降なら保存できること' do
        @event.end_date = @event.start_date+ 60 * 60
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

      it 'start_dateは現在の時間より前だと保存できない' do
        @event.start_date = Time.zone.now- 60 * 60
        @event.valid?
        expect(@event.errors.full_messages).to include("開始日時は現在の日時より遅い時間を選択してください")
      end

      it 'end_dateはstart_dateより前だと保存できない' do
        @event.end_date = @event.start_date- 60 * 60
        @event.valid?
        expect(@event.errors.full_messages).to include("終了時間は開始時刻より遅い時刻を選択してください")
      end

      it 'start_dateは既に保存されている時間と重複していると保存できない' do
      end

      it 'end_dateは既に保存されている時間と重複していると保存できない' do
      end
    end
  end
end

