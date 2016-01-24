require 'minitest/autorun'
require_relative 'person'

class PersonTest < MiniTest::Unit::TestCase
  describe Person do
    before do
      @person = Person.new
    end

    it 'creates a new person with empty task list' do
      @person.tasks.must_equal []
    end

    describe '#add_task' do
      it "adds a task to person's tasks list" do
        task = Task.new(name: 'New Task')

        @person.add_task(task)

        @person.tasks.count.must_equal 1
      end
    end

    describe '#completed_tasks' do
      it 'shows only completed tasks' do
        completed_task = Task.new(name: 'Completed Task', completed: true)
        task_in_progress = Task.new(name: 'In-Progress Task', completed: false)

        @person.add_task(completed_task)
        @person.add_task(task_in_progress)

        @person.completed_tasks.must_include completed_task
        @person.completed_tasks.wont_include task_in_progress
      end
    end
  end

  describe Task do
    it 'creates a task with defaults if no arguments given' do
      task = Task.new

      task.name.must_equal 'Example Task'
      task.completed.must_equal false
    end

    it 'creates a task with given name' do
      task = Task.new(name: 'My New Task')

      task.name.must_equal 'My New Task'
    end

    it 'creates a task with a given completed status' do
      task = Task.new(completed: true)

      task.completed.must_equal true
    end

    it 'displays tasks in a given formatting' do
      task = Task.new(name: 'My Task', completed: true)

      task.to_s.must_equal 'Task name: My Task, Completed: true'
    end
  end
end