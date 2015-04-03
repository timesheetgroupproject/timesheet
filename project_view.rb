class ProjectView

  def list(projects)
    projects.each_with_index { |project, i| puts "#{i+1}. #{project.description} \n   Minutes spent: #{project.report}" }
  end

  def message(mge)
    puts mge
  end

  def report(project)
    puts project
  end

   def report_all(projects)
    projects.each_with_index { |project, i| puts "#{i+1}. #{project.description} \n   Date: #{project.total_time.to_time}" if project.current }
  end
end
