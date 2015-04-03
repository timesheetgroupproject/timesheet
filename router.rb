require_relative("./controllers/project_controller.rb")
require_relative("./controllers/current_project_controller.rb")
require_relative("./timesheetmodel.rb")
require_relative("./testview.rb")

class Router

  def self.route(args)
    user_input = args
    action = ""
    project_name = ""

    project = ProjectController.new(Project, TestView.new)
    current_project = CurrentProjectController.new(Project.current, TestView.new)

    if user_input.count > 1
      action = "#{user_input.shift} #{user_input.shift}"
      project_name = "#{user_input.shift}"
      report_all = "#{action} #{project_name}"
      if report_all == "project report all"
        action = report_all
      end
    else
      action = user_input.shift
    end

    case action
      when "project list" then project.list
      when "project add" then project.add(project_name)
      when "project delete" then project.delete(project_name)
      when "project use" then project.use(project_name)
      when "project report all" then project.report_all
      when "start" then current_project.start
      when "stop" then current_project.stop
      when "report" then current_project.report
      else
        project.error
    end
  end

end
