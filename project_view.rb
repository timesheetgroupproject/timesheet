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

end
