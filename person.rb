class Person
  attr_accessor :tasks

  def initialize
    @tasks = []
  end

  def add_task(task)
    tasks << task
  end

  def completed_tasks
    tasks.select { |t| t.completed }
  end
end

class Task
  attr_reader :name, :completed

  def initialize(opts = {})
    @name = opts[:name] || 'Example Task'
    @completed = opts[:completed] || false
  end

  def to_s
    "Task name: #{name}, Completed: #{completed}"
  end
end

person = Person.new

3.times do |i|
  person.add_task(Task.new(name: "Task #{i + 1}", completed: true))
end

3.times do |i|
  person.add_task(Task.new(name: "Task #{i + 4}", completed: false))
end

person.completed_tasks.each { |task| puts task }
