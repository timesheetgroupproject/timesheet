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
    # it "deletes a project" do
    #   expect(@Project.delete).to eq(DateTime)
    # end
    it "uses a project" do
      @Project.use("Create Timesheet app")
      expect(@Project.current.description).to eq(@project_list[0].description)
    end
    it "returns the current project" do
      @Project.save(projects: @project_list)
      expect(@Project.current.description).to eq(@project_list[1].description)
    end
    # it "the current project starts" do
    #   expect(@project.start).to eq(true)
    # end
    # it "the current project stops" do
    #   expect(@project.stop).to eq(true)
    # end
    # it "returns the current project report" do
    #   expect(@project.report).to eq(true)
    # end


  end

end
