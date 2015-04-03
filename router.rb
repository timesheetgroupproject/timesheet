require_relative("./controllers/project_controller.rb")
require_relative("./controllers/current_project_controller.rb")
require_relative("./timesheetmodel.rb")
require_relative("./project_view.rb")

class Router

  def self.route(args)
    user_input = args
    action = ""
    project_name = ""

    project = ProjectController.new(Project, ProjectView.new)
    current_project = CurrentProjectController.new(Project.current, ProjectView.new)

    if user_input.count > 1
      action = "#{user_input.shift} #{user_input.shift}"
      project_name = "#{user_input.shift}"
    else
      action = user_input.shift
    end

    case action
      when "project list" then project.list
      when "project add" then project.add(project_name)
      when "project delete" then project.delete(project_name)
      when "project use" then project.use(project_name)
      when "start" then current_project.start
      when "stop" then current_project.stop
      when "report" then current_project.report
      else
        project.error
    end
  end

end
