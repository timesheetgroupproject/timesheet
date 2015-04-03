require 'yaml'
require 'date'
require 'time'
class Project

  attr_accessor :description, :total_time, :current, :time_started

  def initialize(args)
    @description = args[:description]
    @total_time = args.fetch(:total_time, 0.0)
    @current = args.fetch(:current, false)
    @time_started = args.fetch(:time_started, nil)
  end

  def report
    @total_time / 60
  end

  def start(args = {})
    @time_started = args.fetch(:time, Time.now)
    self.class.save(project: self)
  end

  def stop # returns elapsed time in seconds as float.
    @total_time += Time.now - @time_started
    self.class.save(project: self)
  end

  def self.list
    load_all
  end

  def self.add(project_name)
    all_projects = list
    new_project = Project.new(description: project_name)
    all_projects << new_project
    save_all(projects: all_projects)
  end

  def self.delete(project_name)
    all_projects = list
    all_projects.delete_if { |project| project.description == project_name }
    save_all(projects: all_projects)
  end

  def self.use(project_name)
    all_projects = set_no_projects_current(list)
    project = all_projects.find { |project| project.description == project_name }
    project.current = true
    save_all(projects: all_projects)
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
    project_to_save = args[:project]
    delete(project_to_save.description)
    save_all(projects: list << project_to_save)
  end

  def self.save_all(args)
    projects = args[:projects]
    File.open('timesheet.yml', 'w') { |f| f.write(projects.to_yaml) }
  end

end
