module Draggable
  def draggable
    click do |button, x, y|
      if button == 1
        @mousedown = true
        @drag_start = x, y
        @drag_original = self.left, self.top
        this = self
        self.app { @dragged = this }
      end
    end
    
    release do |button, x, y|
      if button == 1
        self.left, self.top = @drag_original.first, @drag_original.last
        @mousedown = false
        @drag_start = nil
        @drag_original = nil
        self.app { @dragged = nil }
      end
    end
    
    motion do |x, y|
      if @mousedown
        self.left = @drag_original.first + (x - @drag_start.first)
        self.top  = @drag_original.last  + (y - @drag_start.last)
      end
    end
    
    self
  end
end

class ::Canvas
  include Draggable
end
