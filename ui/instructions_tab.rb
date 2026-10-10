class InstructionsTab

  def initialize(notebook)
    @frame = TkFrame.new(notebook)
    notebook.add(@frame, :text => 'Instructions')
  end

end
