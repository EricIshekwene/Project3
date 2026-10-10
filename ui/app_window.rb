require_relative 'delete_tab'
require_relative 'get_tab'
require_relative 'instructions_tab'
require_relative 'patch_tab'
require_relative 'post_tab'
require_relative 'put_tab'

require 'tk'

class UserApp

  def initialize
    @root = TkRoot.new
    @root.title = "UserApp"
    @root.geometry("1000x800")

    @notebook = Tk::Tile::Notebook.new(@root)
    @notebook.pack('expand' => 1, 'fill' => "both")

    @get_tab = GetTab.new(@notebook)
    @post_tab = DeleteTab.new(@notebook)
    @put_tab = PostTab.new(@notebook)
    @patch_tab = PatchTab.new(@notebook)
    @delete_tab = PutTab.new(@notebook)
    @instructions_tab = InstructionsTab.new(@notebook)
  end

  def run
    Tk.mainloop
  end
end
