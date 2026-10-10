class GetTab

  def initialize(notebook)
    @frame = TkFrame.new(notebook)
    notebook.add(@frame, :text => 'Get')
  end

end
