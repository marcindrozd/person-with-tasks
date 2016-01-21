class Person
  attr_accessor :tasks

  def initialize
    @tasks = []
  end

  def add_task(opts = {})
    tasks << Task.new(name: opts[:name], completed: opts[:completed])
  end

  def display_completed_tasks
    completed = tasks.select { |t| t.completed }
    completed.each { |task| puts task }
  end
end

class Task
  attr_reader :name, :completed

  def initialize(opts = {})
    @name = opts[:name]
    @completed = opts[:completed] || false
  end

  def to_s
    "Task name: #{name}, Completed: #{completed}"
  end
end

person = Person.new

3.times do |i|
  person.add_task(name: "Task #{i + 1}", completed: true)
end

3.times do |i|
  person.add_task(name: "Task #{i + 4}", completed: false)
end

person.display_completed_tasks