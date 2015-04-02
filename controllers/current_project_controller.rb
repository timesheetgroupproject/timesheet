class CurrentProjectController

  def initialize(model, view)
    @model = model
    @view = view
  end

  def start
    @model.start
  end

  def stop
    @model.stop
  end

  def report
    @view.report(@model.report)
  end

end
