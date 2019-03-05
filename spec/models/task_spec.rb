require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'toggle_complete!' do
    it 'should switch complete attribute to false if it began as true' do
      task = Task.create(complete: true)
      task.toggle_complete!
      expect(task.complete).to eq(false)
    end

    it 'should switch the complete attribute to true if it began as false' do
      task = Task.create(complete: false)
      task.toggle_complete!
      expect(task.complete).to eq(true)
    end
  end

  describe 'toggle_favorite' do
    it 'should switch the favorite attribute to false if it began as true' do
      task = Task.create(favorite: true)
      task.toggle_favorite!
      expect(task.favorite).to eq(false)
    end
  end

   describe '#overdue?' do 
     it 'should return true if deadline of the task is earlier than now and complete is false' do 
       task = Task.create(deadline: 1.hour.ago, complete: false)
       expect(task.overdue?).to eq(true)
     end

     it 'should return false if deadline of the task is earlier than now and complete is true' do 
       task = Task.create(deadline: 1.hour.ago, complete: true)
       expect(task.overdue?).to eq(false)
     end

     it 'should return false if deadline of the task is later than now and complete is false' do 
       task = Task.create(deadline: 1.hour.from_now, complete: false)
       expect(task.overdue?).to eq(false)
     end
   end

  describe 'increment_priority!' do
    it 'should update the priority if priority is less than 10' do
      task = Task.create(priority: 5)
      task.increment_priority!
      expect(task.priority).to eq(6)
    end
  end

  describe 'decrement_priority!'do
    it 'should update the priority if priority is greater than 1' do
      task = Task.create(priority: 8)
      task.decrement_priority!
      expect(task.priority).to eq(7)
    end
  end

  describe 'snooze_hour!' do
    it 'should delay the deadline by one hour' do
      time_stamp = Time.now
      task = Task.create(deadline: time_stamp)
      task.snooze_hour!
      expect(task.deadline).to eq(time_stamp + 1.hour)
    end
  end


end
