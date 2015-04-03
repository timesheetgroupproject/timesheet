require_relative 'timesheetmodel'
require 'fileutils'

RSpec.describe Project do

  before do
    @Project = Project
    @project = Project.new(description: "Create Timesheet app", total_time: DateTime.now)
    @project2 = Project.new(description: "project2", total_time: DateTime.now, current: true)
    @project_list = [@project, @project2]
   end

  describe "Project" do
    it "lists all" do
      expect(@Project.list[0].description).to eq(@project_list[0].description)
    end
    it "adds new project" do
      @Project.add("New")
      all_projects = @Project.list
      expect(all_projects.select{|project| project.description == "New"}[0].description).to eq("New")
    end
    it "deletes a project" do
      @Project.delete("project2")
      all_projects = @Project.list
      expect(all_projects.find{|project| project.description == "project2"}).to eq(nil)
    end
    it "uses a project" do
      @Project.use("Create Timesheet app")
      expect(@Project.current.description).to eq(@project_list[0].description)
    end
    it "returns the current project" do
      @Project.save(projects: @project_list)
      expect(@Project.current.description).to eq(@project_list[1].description)
    end
    it "the current project starts" do
      now = DateTime.now
      @project.start(time: now)
      expect(@project.time_started).to eq(now)
    end
    it "the current project stops" do

      project = Project.new(description:"project")
      project.start(time: Time.now)
      sleep(1)
      project.stop

      expect(project.total_time).to be >(1)
    end
    it "returns the current project report" do
      project = Project.new(description:"project")
      project.start(time: Time.now)
      sleep(1)
      project.stop

      expect(project.report).to be >(1/ 60.0)
    end


  end

end
