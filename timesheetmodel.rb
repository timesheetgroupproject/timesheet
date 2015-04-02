require 'yaml'

class Project

  attr_accessor :description, :total_time, :current, :time_started

  def initialize(args)
    @description = args[:description]
    @total_time = args.fetch(:total_time, nil)
    @current = args.fetch(:current, false)
    @time_started = args.fetch(:start_time, nil)

  end

  def self.list
    load_all
  end

  def self.add(project_name)
    all_projects = list
    new_project = Project.new(description: project_name)
    all_projects << new_project
    save(projects: all_projects)
  end

  def self.use(project_name)
    all_projects = list
    all_projects = set_no_projects_current(all_projects)
    project = all_projects.find { |project| project.description == project_name }
    project.current = true
    save(projects: all_projects)
  end

  def self.current
    all_projects = list
    all_projects.select { |project| project.current }[0]
  end

  def self.set_no_projects_current(projects)
    projects.map { |project| project.current = false ; project }
  end

  def self.load_all
    YAML.load_file('timesheet.yml')
  end

  def self.save(args)
    file = args.fetch(:file_name, 'timesheet.yml')
    projects = args[:projects]
    File.open('timesheet.yml', 'w') { |f| f.write(projects.to_yaml) }
  end

end
