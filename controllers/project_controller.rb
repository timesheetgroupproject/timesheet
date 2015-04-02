class ProjectController

  def initialize(model, view)
    @model = model
    @view = view
  end

  def list
    @view.list(@model.list)
  end

  def add(project_name)
    @model.add(project_name)
    @view.message("You have added #{project_name} successfully")
  end

  def delete(project_name)
    @model.delete(project_name)
    @view.message("You have deleted #{project_name} successfully")
  end

  def use(project_name)
    @model.use(project_name)
    @view.message("You have selected #{project_name}")
  end

  def report_all
    @view.report_all(@model.report_all)
  end

  def error
    puts "No action"
  end

end

# project = ProjectController.new(Timesheetmodel.new, TestView.new)
