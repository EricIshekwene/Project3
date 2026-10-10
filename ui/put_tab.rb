class PutTab

  def initialize(notebook)
    @frame = TkFrame.new(notebook)
    notebook.add(@frame, :text => 'Put')
  end

end
