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

    # it 'should return the current time if greater than the deadline' do
    #   task = Task.create(overdue: )
    #   take.overdue?
    #   expect(task.overdue).to eq()
    # end

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
    it 'should update the deadline by one hour' do
      task = Task.create(deadline: )
      task.snooze_hour!
      expect(task.deadline).to eq()
    end
  end


end
