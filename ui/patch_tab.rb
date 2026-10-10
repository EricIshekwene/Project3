class PatchTab

  def initialize(notebook)
    @frame = TkFrame.new(notebook)
    notebook.add(@frame, :text => 'Patch')
  end

end
