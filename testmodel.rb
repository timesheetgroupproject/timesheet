class Timesheetmodel
  def initialize
    @list = []
  end

  def  self.list
    @list = [1, 22]
  end

  def  self.add(project_name)
    return true
  end

  def  self.delete(project_name)
    return true
  end

  def  self.use(project_name)
    return true
  end

  def  self.report_all
    return [1, 2,3]
  end

  def start
    return true
  end

  def stop
    return true
  end

  def report
    return [1, 2,3]
  end

end
