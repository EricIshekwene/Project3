class DeleteTab

  def initialize(notebook)
    @frame = TkFrame.new(notebook)
    notebook.add(@frame, :text => 'Delete')
  end

end
