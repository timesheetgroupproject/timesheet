require_relative 'timesheetmodel'

RSpec.describe Project do

  before do

   end

  describe "Project" do
    it "has a description" do
      expect(@task.description).to eq("Hello World")
    end
    it "is not completed" do
      expect(@task.completed).to eq(false)
    end
    it "has a creation date" do
      expect(@task.creation_date.class).to eq(DateTime)
    end
    # it "has a completed date" do
    #   expect(@task.completion_date.class).to eq(DateTime)
    # end
    it "can be created complete" do
      @task = Task.new(description: "Hihi", completed: true)
      expect(@task.completed).to eq(true)
    end

  end

end
