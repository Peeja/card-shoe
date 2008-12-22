module Droppable
  def droppable
    hover do
      slot = self
      app do
        if @dragged
          # Use append so that drawing calls are redirected to the canvas inside the block.
          slot.append { yield @dragged }
        end
      end
    end
    self
  end
end

class ::Canvas
  include Droppable
end
