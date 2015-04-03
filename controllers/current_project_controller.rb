class CurrentProjectController

  def initialize(model, view)
    @model = model
    @view = view
  end

  def start
    @model.start({})
    @view.message("You are start working on project")
  end

  def stop
    @model.stop
    @view.message("You have stopped working on project")
  end

  def report
    @view.report(@model.report)
  end

end
